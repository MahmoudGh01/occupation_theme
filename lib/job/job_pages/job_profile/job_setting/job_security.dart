import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import '../../../job_gloabelclass/job_fontstyle.dart';
import '../../job_theme/job_themecontroller.dart';

class JobSecurity extends StatefulWidget {
  const JobSecurity({Key? key}) : super(key: key);

  @override
  State<JobSecurity> createState() => _JobSecurityState();
}

class _JobSecurityState extends State<JobSecurity> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());
  bool isDark = true;
  bool isDark1 = true;
  bool isDark2 = true;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Security".tr,style: urbanistBold.copyWith(fontSize: 22 )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Remember me".tr,style: urbanistSemiBold.copyWith(fontSize: 16 )),
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
                  Text("Biometric ID".tr,style: urbanistSemiBold.copyWith(fontSize: 16 )),
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
                  Text("Face ID".tr,style: urbanistSemiBold.copyWith(fontSize: 16 )),
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
                  Text("Google Authenticator".tr,style: urbanistSemiBold.copyWith(fontSize: 16 )),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_outlined,size: 15),
                ],
              ),
              SizedBox(height: height/26,),
              Container(
                height: height/15,
                width: width/1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:JobColor.lightblue,
                ),
                child: Center(
                  child: Text("Change_PIN".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:JobColor.appcolor)),
                ),
              ),
              SizedBox(height: height/46,),
              Container(
                height: height/15,
                width: width/1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:JobColor.lightblue,
                ),
                child: Center(
                  child: Text("Change_Password".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:JobColor.appcolor)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
