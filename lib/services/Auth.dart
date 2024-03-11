import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:job_seeker/job/job_pages/job_home/job_dashboard.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import '../job/job_pages/job_authentication/job_login.dart';
import '../job/job_pages/job_authentication/job_loginoption.dart';
import '../models/user.dart';
import '../providers/userprovider.dart';

import '../utils/constants.dart';
import '../utils/utils.dart';

class AuthService extends GetxController {
  // Observable auth state
  var isAuthenticated = false.obs;
  var currentUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    _loadUserAuthenticated();
  }

  Future<void> _loadUserAuthenticated() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    isAuthenticated.value = isLoggedIn;
  }

  void signUpUser({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      Uri uri = Uri.parse('${Constants.uri}/signup');
      http.Response res = await http.post(
        uri,
        body: jsonEncode({'email': email, 'password': password, 'name': name}),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8"
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  void signInUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/signin'),
        // alternate method to do this M2
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8"
        },
      );
      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();

          userProvider.setUser(jsonDecode(res.body)); // Pass decoded JSON map

          await prefs.setString('token', jsonDecode(res.body)['token']);
          await prefs.setString('refresh', jsonDecode(res.body)['refresh']);
          await prefs.setBool('isLoggedIn', true);
          isAuthenticated.value = true;
          navigator.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => JobDashboard("0"),
              ),
              (route) => false);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // get user data

  void signOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('isLoggedIn');
    isAuthenticated.value = false;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => JobLoginoption()),
      (Route<dynamic> route) => false, // Remove all routes below
    );
  }

  void forgotPassword(
      {required BuildContext context, required String email}) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);

      // Set the email in the UserProvider
      userProvider.setPasswordResetEmail(email);

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/forgot_password'),
        body: jsonEncode({'email': email}),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
        },
      );
      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Password reset email sent successfully');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<int> verifyCode(
      {required BuildContext context,
      required String code,
      required String email}) async {
    try {
      // Get the email from the UserProvider
      var userProvider = Provider.of<UserProvider>(context, listen: false);

      email = userProvider.user.email;
      if (email.isEmpty) {
        showSnackBar(context, 'Email address not found');
        return 400; // Return 400 if email is empty
      }

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/verify_code'),
        body: jsonEncode({'email': email, 'code': code}),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
        },
      );

      if (res.statusCode == 200) {
        showSnackBar(context, 'Verification code is valid');
        return 200; // Return 200 if verification is successful
      } else {
        return 400; // Return 400 if verification fails
      }
    } catch (e) {
      showSnackBar(context, e.toString());
      return 400; // Return 400 if an error occurs
    }
  }

  void changePassword(
      {required BuildContext context,
      required String newPassword,
      required String email}) async {
    try {
      // Get the email from the UserProvider
      var userProvider = Provider.of<UserProvider>(context, listen: false);

      email = userProvider.user.email;
      if (email.isEmpty) {
        showSnackBar(context, 'Email address not found');
        return;
      }

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/reset_password'),
        body: jsonEncode({'email': email, 'new_password': newPassword}),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
        },
      );
      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Password successfully changed');
          // Navigate to login screen or perform desired action
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void setPassword(
      {required BuildContext context,
      required String newPassword,
      required String email}) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/set-password'),
        body: jsonEncode({'email': email, 'password': newPassword}),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
        },
      );
      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Password successfully changed');
          // Navigate to login screen or perform desired action
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> sendGoogleSignInDataToBackend(
      String code, BuildContext context) async {
    final Uri uri = Uri.parse('${Constants.uri}/google-sign-in');
    var userProvider = Provider.of<UserProvider>(context, listen: false);

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'code': code}),
    );

    if (response.statusCode == 200) {
      print('Google Sign-In data sent to backend endpoint successfully');
      final responseBody = json.decode(response.body);

      // Directly use the decoded JSON if it matches your expected structure
      if (responseBody != null && responseBody is Map<String, dynamic>) {
        print(responseBody);

        SharedPreferences prefs = await SharedPreferences.getInstance();

        userProvider.setUser(responseBody); // Pass decoded JSON map

        await prefs.setString('token', responseBody['token']);
        await prefs.setString('refresh', responseBody['refresh']);

        // Store the token securely
        await prefs.setString('x-auth-token', responseBody['token']);
        await prefs.setBool('isLoggedIn', true);
        isAuthenticated.value = true;
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => JobDashboard("0")),
          (route) => false,
        );
      } else {
        print("Invalid response format received.");
      }
    } else {
      print(
          'Error sending Google Sign-In data to backend: ${response.statusCode}');
    }
  }
}
