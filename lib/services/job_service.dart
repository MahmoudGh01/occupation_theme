import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/job_model.dart';
import '../utils/constants.dart';

class JobService {


  Future<List<JobModel>> getAllJobs() async {
    final response = await http.get(Uri.parse('${Constants.uri}/jobs'));
    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => JobModel.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs');
    }
  }

  Future<List<JobModel>> getJobById(String jobId) async {
    final response = await http.get(Uri.parse('${Constants.uri}/jobs/$jobId'));
    if (response.statusCode == 200) {
      return [JobModel.fromJson(json.decode(response.body))];
    } else {
      throw Exception('Failed to load job details');
    }
  }

  Future<List<JobModel>> createJob(JobModel newJob) async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.uri}/jobs'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(newJob.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return getAllJobs(); // Return the updated list of jobs
      } else {
        throw Exception(
            'Failed to create job. Server returned ${response.statusCode}');
      }
    } catch (error) {
      print('Error creating job: $error');
      throw Exception('Failed to create job');
    }
  }

  Future<List<JobModel>> editJob(JobModel updatedJob) async {
    final response = await http.put(
      Uri.parse('${Constants.uri}/jobs/${updatedJob.id}'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(updatedJob.toJson()),
    );

    if (response.statusCode == 200) {
      return getAllJobs(); // Return the updated list of jobs
    } else {
      throw Exception('Failed to edit job');
    }
  }

  Future<List<JobModel>> deleteJob(String jobId) async {
    final response = await http.delete(Uri.parse('${Constants.uri}/jobs/$jobId'));

    if (response.statusCode == 200) {
      return getAllJobs(); // Return the updated list of jobs
    } else {
      throw Exception('Failed to delete job');
    }
  }
}
