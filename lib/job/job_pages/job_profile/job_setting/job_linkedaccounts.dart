import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import '../../../job_gloabelclass/job_fontstyle.dart';
import '../../../job_gloabelclass/job_icons.dart';
import '../../job_theme/job_themecontroller.dart';

class JobLinkedAccounts extends StatefulWidget {
  const JobLinkedAccounts({Key? key}) : super(key: key);

  @override
  State<JobLinkedAccounts> createState() => _JobLinkedAccountsState();
}

class _JobLinkedAccountsState extends State<JobLinkedAccounts> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());
  bool isDark = true;
  bool isDark1 = true;
  bool isDark2 = true;
  bool isDark3 = false;
  bool isDark4 = false;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Linked_Accounts".tr,style: urbanistBold.copyWith(fontSize: 22 )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(JobPngimage.google,height: height/30,width: height/30),
                  SizedBox(width: width/26),
                  Text("Google".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                  const Spacer(),
                  SizedBox(
                    height: height / 36,
                    child: Switch(
                        activeColor: JobColor.appcolor,
                        onChanged: (state) {
                          setState(() {
                            isDark = state;
                          });
                        },
                        value: isDark),
                  ),
                ],
              ),
              SizedBox(height: height/26,),
              Row(
                children: [
                  Image.asset(JobPngimage.apple,height: height/30,width: height/30,color: themedata.isdark ? JobColor.white : JobColor.black,),
                  SizedBox(width: width/26),
                  Text("Apple".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                  const Spacer(),
                  SizedBox(
                    height: height / 36,
                    child: Switch(
                        activeColor: JobColor.appcolor,
                        onChanged: (state) {
                          setState(() {
                            isDark1 = state;
                          });
                        },
                        value: isDark1),
                  ),
                ],
              ),
              SizedBox(height: height/26,),
              Row(
                children: [
                  Image.asset(JobPngimage.facebook,height: height/30,width: height/30),
                  SizedBox(width: width/26),
                  Text("Facebook".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                  const Spacer(),
                  SizedBox(
                    height: height / 36,
                    child: Switch(
                        activeColor: JobColor.appcolor,
                        onChanged: (state) {
                          setState(() {
                            isDark2 = state;
                          });
                        },
                        value: isDark2),
                  ),
                ],
              ),
              SizedBox(height: height/26,),
              Row(
                children: [
                  Image.asset(JobPngimage.a4,height: height/30,width: height/30),
                  SizedBox(width: width/26),
                  Text("Twitter".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                  const Spacer(),
                  SizedBox(
                    height: height / 36,
                    child: Switch(
                        activeColor: JobColor.appcolor,
                        onChanged: (state) {
                          setState(() {
                            isDark3 = state;
                          });
                        },
                        value: isDark3),
                  ),
                ],
              ),
              SizedBox(height: height/26,),
              Row(
                children: [
                  Image.asset(JobPngimage.linkedin,height: height/30,width: height/30),
                  SizedBox(width: width/26),
                  Text("Linkedin".tr,style: urbanistSemiBold.copyWith(fontSize: 18)),
                  const Spacer(),
                  SizedBox(
                    height: height / 36,
                    child: Switch(
                        activeColor: JobColor.appcolor,
                        onChanged: (state) {
                          setState(() {
                            isDark4 = state;
                          });
                        },
                        value: isDark4),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
