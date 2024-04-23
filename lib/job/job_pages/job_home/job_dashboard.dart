import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import 'package:job_seeker/job/job_gloabelclass/job_fontstyle.dart';
import 'package:job_seeker/job/job_gloabelclass/job_icons.dart';
import 'package:job_seeker/job/job_pages/job_application/job_application.dart';
import 'package:job_seeker/job/job_pages/job_meeting/interview_screen.dart';
import 'package:job_seeker/job/job_pages/job_theme/job_themecontroller.dart';

import '../../../screens/screenQuizs.dart';
import '../job_message/job_message.dart';
import '../job_profile/job_profile.dart';
import '../job_saveapplication/job_saveapplication.dart';
import 'job_home.dart';

// ignore: must_be_immutable
class JobDashboard extends StatefulWidget {
  String? index;

  JobDashboard(this.index, {super.key});

  @override
  State<JobDashboard> createState() => _JobDashboardState();
}

class _JobDashboardState extends State<JobDashboard> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());

  PageController pageController = PageController();
  int _selectedItemIndex = 0;

  final List<Widget> _pages =  [
    JobHome(),
    ScreenQuiz(),
    JobApplication(),
    InterviewMeetingPage(),
    JobProfile()
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget _bottomTabBar() {
    return BottomNavigationBar(
      currentIndex: _selectedItemIndex,
      onTap: _onTap,
      elevation: 0,
      backgroundColor:
          themedata.isdark ? JobColor.black : JobColor.white,
      selectedLabelStyle: urbanistBold.copyWith(fontSize: 10),
      unselectedLabelStyle: urbanistMedium.copyWith(fontSize: 10),
      selectedFontSize: 10,
      unselectedFontSize: 10,
      selectedItemColor: JobColor.appcolor,
      unselectedItemColor: JobColor.textgray,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
            JobPngimage.home,
            height: height / 36,
            color: themedata.isdark
                ? JobColor.white
                : JobColor.grey,
          ),
          activeIcon: Image.asset(JobPngimage.homefill,
              height: height / 36,color: JobColor.appcolor),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            JobPngimage.save,
            height: height / 36,
            color: themedata.isdark
                ? JobColor.white
                : JobColor.grey,
          ),
          activeIcon: Image.asset(JobPngimage.savefill,
              height: height / 36, color: JobColor.appcolor),
          label: 'Saved Jobs',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            JobPngimage.applications,
            height: height / 36,
            color: themedata.isdark
                ? JobColor.white
                : JobColor.grey,
          ),
          activeIcon: Image.asset(JobPngimage.applicationfill,
              height: height / 36,color: JobColor.appcolor),
          label: 'Applications',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            JobPngimage.chat,
            height: height / 36,
            color: themedata.isdark
                ? JobColor.white
                : JobColor.grey,
          ),
          activeIcon: Image.asset(JobPngimage.chatfill,
              height: height / 36,color: JobColor.appcolor),
          label: 'Message',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            JobPngimage.profiles,
            height: height / 36,
            color: themedata.isdark
                ? JobColor.white
                : JobColor.grey,
          ),
          activeIcon: Image.asset(JobPngimage.profileicon,
            height: height / 36,color: JobColor.appcolor,),
          label: 'Profile',
        ),
      ],
    );
  }

  void _onTap(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return GetBuilder<JobThemecontroler>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: _bottomTabBar(),
        body: _pages[_selectedItemIndex],
      );
    });
  }
}
