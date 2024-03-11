// job_model.dart

class JobModel {
  final String id;
  final String jobTitle;
  final String jobDescription;
  final String companyInformation;
  final String location;
  final String employmentType;
  final String salaryCompensation;
  final List<String> requirements;

  JobModel({
    required this.id,
    required this.jobTitle,
    required this.jobDescription,
    required this.companyInformation,
    required this.location,
    required this.employmentType,
    required this.salaryCompensation,
    required this.requirements,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['_id'],
      jobTitle: json['jobTitle'],
      jobDescription: json['description'],
      companyInformation: json['company_information'],
      location: json['location'],
      employmentType: json['employment_type'],
      salaryCompensation: json['salary_compensation'],
      requirements: json['requirements'] != null
          ? List<String>.from(json['requirements'])
          : [],
    );
  }



  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'job_title': jobTitle,
      'job_description': jobDescription,
      'company_information': companyInformation,
      'location': location,
      'employment_type': employmentType,
      'salary_compensation': salaryCompensation,
      'skills_qualifications': requirements,
    };
  }
}
