import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'dart:io'; // Import File class
// Import this package for ChangeNotifier
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';


import '../models/job_model.dart';
import '../models/user.dart';
import '../providers/userprovider.dart';
import '../utils/constants.dart';

class JobApplicationController {
//Job score
  String? dropboxClientId;
  String? dropboxSecret;
  String? cvFilePath;
  String? motivationalLetter;
  double? _fitScore;
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController emailController;


  JobApplicationController({
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.cvFilePath,
    required this.motivationalLetter,
  });
  double? get fitScore => _fitScore;

  void updateFitScore(double score) {
    _fitScore = score;
  }

  void applyForJob(BuildContext context,JobModel job,Function(double fitScore) onSuccess) async {
    var user = Provider.of<UserProvider>(context, listen: false).user;
    String userID = user.id;
    String jobID = job.id;
    List<String> userSkills = user.skills;

    // Create a Map to represent the request data
    Map<String, dynamic> requestData = {
      "user_id": userID,
      "job_id": jobID,
      "skills": userSkills,
    };

    try {
      // Convert requestData to JSON string
      String requestBody = jsonEncode(requestData);

      // Create a Uri object from the URL string
      Uri url = Uri.parse('${Constants.uri}/apply-for-job');

      // Send job application data to the backend
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: requestBody,
      );

      // Handle response from the backend
      if (response.statusCode == 200) {
        // Parse fit score from response body
        dynamic responseBody = jsonDecode(response.body);
        double? fitScore =
            double.tryParse(responseBody['fit_score'].toString());
        if (fitScore != null) {
          // Call the success callback with the fit score
          onSuccess(fitScore);
        } else {
          print('Invalid fit score format');
        }
      } else {
        print('Failed to submit job application: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending job application: $e');
    }
  }

  Future<bool> checkAuthorized(bool authorize) async {
    // Check if Dropbox credentials are available
    if (dropboxClientId == null || dropboxSecret == null) {
      print('Dropbox credentials not found.');
      return false;
    }

    return false;
  }

  void saveAsPDF(String coverLetter, BuildContext context) {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text(coverLetter),
        );
      },
    ));

    // final output = File('cover_letter.pdf').openWrite();
    // pdf.save().then((_) => output.close());
  }

  Future<void> postulate(JobModel job,BuildContext context) async {
    try {
      if (cvFilePath == null) {
        print('CV file path is null. Cannot submit application.');
        // Show appropriate error message to the user
        return;
      }
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${Constants.uri}/save-application'),
      );
      var user = Provider.of<UserProvider>(context, listen: false).user;
      String userID = user.id;

      request.fields['userId'] = userID;
      print(userID);
      request.fields['coverLetter'] = motivationalLetter ?? '';
      request.fields['job_id'] = job.id; // Add the job ID

      var cvFile = File(cvFilePath!);
      var cvStream = http.ByteStream(cvFile.openRead());
      var cvLength = await cvFile.length();
      var cvMultipartFile = http.MultipartFile(
        'cvPdf',
        cvStream,
        cvLength,
        filename: cvFilePath!.split('/').last,
      );
      request.files.add(cvMultipartFile);
      print(request);
      print(request.files);
      var response = await request.send();
      print(response);
      if (response.statusCode == 200) {
        // Application saved successfully
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Application Submitted'),
            content: Text('Your application has been submitted successfully.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      } else {
        // Handle unsuccessful response
        print('Failed to submit application: ${response.statusCode}');
        // Show appropriate error message to the user
      }
    } catch (e) {
      print('Error submitting application: $e');
      // Handle error
      // Show appropriate error message to the user
    }
  }

  Future<String> generateCoverLetter(JobModel job) async {
    try {
      final String prompt =
          "Write a professional  cover letter for the position of Senior Software Engineer at edreams  you will play a crucial role in  '${job.jobDescription}'  this cover letter will apply this user Farah torkhani for that position (a cover letter as a user )";
      final String openaiApiKey =
          "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";

      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openaiApiKey',
        },
        body: json.encode({
          'prompt': prompt,
          'max_tokens': 150,
          'model': 'davinci-002',
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['choices'][0]['text'];
      } else if (response.statusCode == 429) {
        await Future.delayed(Duration(seconds: 20));
        return generateCoverLetter(job);
      } else {
        throw Exception(
            'Failed to generate cover letter: ${response.statusCode}');
      }
    } catch (e) {
      print('Error generating cover letter: $e');
      throw Exception('Failed to generate cover letter');
    }
  }

}
