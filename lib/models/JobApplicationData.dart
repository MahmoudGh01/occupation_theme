import 'dart:convert';

class JobApplicationData {
  final String jobID;
  final List<String> skills;

  JobApplicationData({
    required this.jobID,
    required this.skills,
  });

  Map<String, dynamic> toJson() {
    return {
      'job_id': jobID,
      'skills': skills,
    };
  }

  String toJsonString() {
    return json.encode(toJson());
  }
}

class JobApplicationResponse {
  final double fitScore;

  JobApplicationResponse({
    required this.fitScore,
  });

  factory JobApplicationResponse.fromJson(Map<String, dynamic> json) {
    return JobApplicationResponse(
      fitScore: json['fit_score'] ?? 0.0,
    );
  }
}
