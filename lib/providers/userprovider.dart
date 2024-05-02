import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../utils/constants.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    lastname: '',
    email: '',
    token: '',
    password: '',
    profilePicturePath: '',
    birthdate: '',
    title: '',
    role: 'user',
    refresh: '',
  );

  User get user => _user;

  void setUser(Map<String, dynamic> userMap) {
    _user = User.fromJson(userMap);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }

  void setPasswordResetEmail(String email) {
    _user.email = email;
    notifyListeners();
  }

  void updateUserProfile(String birthdate, String jobTitle , List<String> skills) {
    // Update the user's profile on the backend
    // Then update the local user object
    _user.birthdate = birthdate;
    _user.title = jobTitle;
    _user.skills = skills ;
    notifyListeners();
  }

  void addSkill(String skill) {
    if (!_user.skills.contains(skill)) {
      _user.skills.add(skill);
      notifyListeners();
    }
  }

  void removeSkill(String skill) {
    _user.skills.remove(skill);
    notifyListeners();
  }

  Future<bool> refreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? refreshToken = prefs.getString('refresh');
    if (refreshToken == null) return false;

    try {
      var response = await http.post(
        Uri.parse('${Constants.uri}/refreshToken'),
        headers: {
          'Content-Type': "application/json; charset=UTF-8",
          'Authorization': "Bearer $refreshToken"
        },
      );

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        String newAccessToken = body['access_token'];
        await prefs.setString(
            'token', newAccessToken); // Save the new access token
        return true; // Indicate success
      }
      return false; // Indicate failure
    } catch (e) {
      print(e.toString());
      return false; // Indicate failure on exception
    }
  }

  Future<void> fetchUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      // No token available, user needs to log in
      prefs.setString('token', '');
  return;
    }

    var tokenRes = await http.get(
      Uri.parse('${Constants.uri}/tokenIsValid'),
      headers: <String, String>{
        'Content-Type': "application/json; charset=UTF-8",
        'Authorization': "Bearer $token"
      },
    );

    var body = jsonDecode(tokenRes.body);

    if (tokenRes.statusCode == 200 && body["valid"] == true) {
      // Token is valid, process user data
      prefs.setString('token', token!); // Refresh the token in local storage if needed

      var userMap = body as Map<String, dynamic>;
      setUser(userMap); // Assuming setUser is a method to update user info in the app
      notifyListeners();

    } else if (tokenRes.statusCode == 401 ||tokenRes.statusCode == 500|| tokenRes.statusCode == 422  || !body["valid"]) {
      // Token is not valid or expired, try to refresh it
      bool refreshed = await refreshToken();
      if (refreshed) {
        // If token refresh was successful, fetch user data again
        await fetchUserData();
      } else {
        prefs.remove('token');
        // Unable to refresh the token, possibly log the user out or prompt re-login
        print("Unable to refresh token. User must log in again.");
      }
    } else {
      // Handle other errors or scenarios as needed
      print("An error occurred: ${body['message']}");
    }
  }

}
