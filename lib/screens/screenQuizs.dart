import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../job/job_gloabelclass/job_color.dart';
import '../models/quiz.dart';
import '../models/testQ.dart';
import '../providers/userprovider.dart';
import '../utils/constants.dart';


class ScreenQuiz extends StatefulWidget {
  const ScreenQuiz({Key? key}) : super(key: key);

  @override
  State<ScreenQuiz> createState() => _ScreenQuizState();
}

class _ScreenQuizState extends State<ScreenQuiz> {
  Future<Quiz> getQuizById(String id) async {
    Uri fetchUri = Uri.parse("${Constants.uri}/onequiz/${id}");
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    try {
      final response = await http.get(fetchUri, headers: headers);
      if (response.statusCode == 200) {
        return Quiz.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load quiz');
      }
    } catch (e) {
      print('Error during fetchQuiz: $e');
      throw Exception('Failed to load quiz');
    }
  }

  Future<List<TestQ>> fetchQuiz() async {
    var user = Provider.of<UserProvider>(context, listen: false).user.id;

    List<TestQ> testquizs = [];
    Uri fetchUri =
    Uri.parse("${Constants.uri}/testQuizByCandidat/$user");
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    try {
      final response = await http.get(fetchUri, headers: headers);
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        for (var item in data) {
          Quiz q = await getQuizById(item["idQuiz"]);
          testquizs.add(TestQ(
              id: item["_id"],
              idRecruter: item["idRecruter"],
              idCandidat: item["idCandidat"],
              idQuiz: item["idQuiz"],
              quiz: q,
              date: item["date"],
              score: item["score"],
              status: item["status"]));
        }
      } else {
        throw Exception('Failed to load test quizs');
      }
    } catch (e) {
      print('Error during fetchQuiz: $e');
      throw Exception('Failed to load test quiiiizs');
    }
    return testquizs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 40,
              height: 40,
            ),
            SizedBox(width: 10),
            Text(
              'My Job Applications',
              style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<TestQ>>(
        future: fetchQuiz(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitCubeGrid(
                  color: JobColor.appcolor,
                  size: 50.0
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<TestQ>? testq = snapshot.data;
            return ListView.builder(
              itemCount: testq!.length,
              itemBuilder: (context, index) {
                if (testq[index].status == "start") {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      leading: Image.asset(
                        'assets/lquiz.jpg',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        testq[index].quiz.theme,
                        style: TextStyle(
                            color: JobColor.appcolor,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${testq[index].quiz.questions.length} questions',
                          ),
                          Text(
                            'Date: ${testq[index].date}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/quiz', arguments: testq[index]);
                        },
                        child: Text(
                          'Start',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: JobColor.appcolor,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      leading: Image.asset(
                        'assets/lquiz.jpg',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        testq[index].quiz.theme,
                        style: TextStyle(
                            color: JobColor.appcolor,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${testq[index].quiz.questions.length} questions',
                          ),
                          Text(
                            'Date: ${testq[index].date}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Quiz already completed',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }

}