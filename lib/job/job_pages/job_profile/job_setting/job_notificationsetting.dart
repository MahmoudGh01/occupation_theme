import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import '../../../job_gloabelclass/job_fontstyle.dart';
import '../../job_theme/job_themecontroller.dart';

class JobNotificationSetting extends StatefulWidget {
  const JobNotificationSetting({Key? key}) : super(key: key);

  @override
  State<JobNotificationSetting> createState() => _JobNotificationSettingState();
}

class _JobNotificationSettingState extends State<JobNotificationSetting> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());
  bool isDark = true;
  bool isDark1 = true;
  bool isDark2 = true;
  bool isDark3 = false;
  bool isDark4 = false;
  bool isDark5 = false;
  bool isDark6 = true;
  bool isDark7 = false;
  bool isDark8 = false;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification".tr,style: urbanistBold.copyWith(fontSize: 22 )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              Row(
                children: [
                  Text("General Notification".tr,style: urbanistSemiBold.copyWith(fontSize: 16 )),
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
                  Text("Sound".tr,style: urbanistSemiBold.copyWith(fontSize: 16 )),
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
                  Text("Vibrate".tr,style: urbanistSemiBold.copyWith(fontSize: 16 )),
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
                  SizedBox(
                    width: width/1.3,
                      child: Text("Notify me when there is a job recommendation".tr,style: urbanistSemiBold.copyWith(fontSize: 16 ))),
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
                  SizedBox(
                      width: width/1.3,
                      child: Text("Notify me when there is a job invitation".tr,style: urbanistSemiBold.copyWith(fontSize: 16 ))),
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
              SizedBox(height: height/26,),
              Row(
                children: [
                  SizedBox(
                      width: width/1.3,
                      child: Text("Notify me when a recruiter views my profile".tr,style: urbanistSemiBold.copyWith(fontSize: 16 ))),
                  const Spacer(),
                  SizedBox(
                    height: height / 36,
                    child: Switch(
                        activeColor: JobColor.appcolor,
                        onChanged: (state) {
                          setState(() {
                            isDark5 = state;
                          });
                        },
                        value: isDark5),
                  ),
                ],
              ),
              SizedBox(height: height/26,),
              Row(
                children: [
                  SizedBox(
                      width: width/1.3,
                      child: Text("App Updates".tr,style: urbanistSemiBold.copyWith(fontSize: 16 ))),
                  const Spacer(),
                  SizedBox(
                    height: height / 36,
                    child: Switch(
                        activeColor: JobColor.appcolor,
                        onChanged: (state) {
                          setState(() {
                            isDark6 = state;
                          });
                        },
                        value: isDark6),
                  ),
                ],
              ),
              SizedBox(height: height/26,),
              Row(
                children: [
                  SizedBox(
                      width: width/1.3,
                      child: Text("New Services Available".tr,style: urbanistSemiBold.copyWith(fontSize: 16 ))),
                  const Spacer(),
                  SizedBox(
                    height: height / 36,
                    child: Switch(
                        activeColor: JobColor.appcolor,
                        onChanged: (state) {
                          setState(() {
                            isDark7 = state;
                          });
                        },
                        value: isDark7),
                  ),
                ],
              ),
              SizedBox(height: height/26,),
              Row(
                children: [
                  SizedBox(
                      width: width/1.3,
                      child: Text("New Tips Available".tr,style: urbanistSemiBold.copyWith(fontSize: 16 ))),
                  const Spacer(),
                  SizedBox(
                    height: height / 36,
                    child: Switch(
                        activeColor: JobColor.appcolor,
                        onChanged: (state) {
                          setState(() {
                            isDark8 = state;
                          });
                        },
                        value: isDark8),
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
