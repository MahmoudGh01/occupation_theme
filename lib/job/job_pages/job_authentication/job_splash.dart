import 'package:flutter/material.dart';
import 'package:job_seeker/job/job_gloabelclass/job_icons.dart';
import 'package:provider/provider.dart';

import '../../../providers/userprovider.dart';
import '../job_home/job_dashboard.dart';
import 'job_loginoption.dart';
import 'job_welcomescreen.dart';

class JobSplash extends StatefulWidget {
  const JobSplash({Key? key}) : super(key: key);

  @override
  State<JobSplash> createState() => _JobSplashState();
}

class _JobSplashState extends State<JobSplash> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
    await userProvider.fetchUserData();

    if (userProvider.user.token.isNotEmpty) {
      // If user data exists, navigate to Dashboard
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => JobDashboard("0")));
    } else {
      // Navigate to LoginOption if no user data
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => JobLoginoption()));
    }
  }

  dynamic size;
  double height = 0.00;
  double width = 0.00;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Center(
          child: Image.asset(JobPngimage.splash,height: height/6,fit: BoxFit.fitHeight,)),
    );
  }
}
