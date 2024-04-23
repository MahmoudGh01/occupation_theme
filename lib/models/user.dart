import 'dart:convert';

class User {
  String id;
  String name;
  String email;
  String token;
  String refresh;
  String password;
  String profilePicturePath;
  String lastname;
  String title;
  String birthdate;
  String role;
  List<String> skills;



  User({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.password,
    this.profilePicturePath = "",
    this.lastname = "",
    this.title = "",
    this.birthdate = "",
    this.role = "User",
    this.skills = const[""],
    required this.refresh,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> userJson = json['user'] ?? {};
    // Ensure 'skills' is a list and cast it to List<String>, provide a default list if necessary
    List<String> skillsList = [];
    if (userJson['skills'] != null) {
      skillsList = List.from(userJson['skills']).map((skill) => skill.toString()).toList();
    }
    return User(
      id: userJson['_id'] ?? '',
      email: userJson['email'] ?? '',
      password: userJson['password'] ?? '',
      name: userJson['name'] ?? '',
      lastname: userJson['lastname'] ?? '',
      title: userJson['title'] ?? "",
      birthdate: userJson['birthdate'] ?? "",
      role: userJson['role'] ?? "User",
      profilePicturePath: userJson['profile_picture'] ?? "",
      token: json['token'] ?? '',
      refresh: json['refresh'] ?? '',
      skills: skillsList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'token': token,
      'password': password,
      'profile_picture': profilePicturePath,
      'lastname': lastname,
      'title': title,
      'birthdate': birthdate,
      'role': role,
    };
  }

  String toJson() => json.encode(toMap());
}
