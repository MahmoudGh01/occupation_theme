import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import 'package:job_seeker/job/job_pages/job_message/job_chatting.dart';
import '../../../models/quiz.dart';
import '../../../utils/constants.dart';
import '../../job_gloabelclass/job_fontstyle.dart';
import '../../job_gloabelclass/job_icons.dart';
import '../job_theme/job_themecontroller.dart';

class JobQuizz extends StatefulWidget {
  const JobQuizz({Key? key}) : super(key: key);

  @override
  State<JobQuizz> createState() => _JobQuizzState();
}

// Fonction pour récupérer les quizzes à partir du JSON
List<Quiz> parseQuizzes(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Quiz>((json) => Quiz.fromJson(json)).toList();
}

// Fonction pour récupérer tous les quizzes depuis le serveur
Future<List<Quiz>> fetchQuiz() async {
  // URL pour récupérer les quizzes
  Uri fetchUri = Uri.parse("${Constants.uri}/all_quiz");

  // En-têtes de la requête
  Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  try {
    // Faire la requête HTTP GET
    final response = await http.get(fetchUri, headers: headers);

    if (response.statusCode == 200) {
      // Si la requête est réussie, désérialiser les données JSON en objets Dart
      List<Quiz> quizzes = parseQuizzes(response.body);
      return quizzes;
    } else {
      // Si la requête a échoué, afficher une boîte de dialogue d'erreur
      throw Exception('Failed to load quizzes');
    }
  } catch (e) {
    // Gérer les exceptions et afficher une boîte de dialogue d'erreur
    print('Error during fetchQuiz: $e');
    throw Exception('Failed to load quizzes');
  }
}

class _JobQuizzState extends State<JobQuizz> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());



  String chatimg = 'assets/lquiz.jpg';

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(15),
          child: Image.asset(
            JobPngimage.logo,
            height: height / 36,
          ),
        ),
        title: Text("Quizz".tr, style: urbanistBold.copyWith(fontSize: 22)),
        actions: [
          Row(
            children: [
              Image.asset(
                JobPngimage.search,
                height: height / 36,
                color: themedata.isdark ? JobColor.white : JobColor.black,
              ),
              SizedBox(
                width: width / 36,
              ),
              Image.asset(
                JobPngimage.more,
                height: height / 30,
                color: themedata.isdark ? JobColor.white : JobColor.black,
              ),
              const SizedBox(
                width: 15,
              )
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: FutureBuilder<List<Quiz>>(
            future: fetchQuiz(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child:
                        SpinKitCubeGrid(color: JobColor.appcolor, size: 50.0));
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                List<Quiz>? quizzes = snapshot.data;
                return ListView.separated(
                  itemCount: quizzes!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: JobColor.transparent,
                      highlightColor: JobColor.transparent,
                      onTap: () {
                        Get.toNamed('/detailquiz',arguments: quizzes[index]);
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: JobColor.transparent,
                            backgroundImage:
                                AssetImage(chatimg),
                          ),
                          SizedBox(width: width / 26),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(quizzes[index].theme,
                                  style: urbanistBold.copyWith(fontSize: 20)),
                              SizedBox(height: height / 96),
                              Text('${quizzes[index].questions.length} questions',
                                  style: urbanistMedium.copyWith(
                                      fontSize: 18, color: JobColor.textgray)),
                            ],
                          ),

                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: height / 36);
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
