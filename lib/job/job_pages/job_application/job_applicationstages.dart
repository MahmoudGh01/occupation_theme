import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import '../../../models/JobApplication.dart';
import '../../../screens/calendar_screen.dart';
import '../../job_gloabelclass/job_fontstyle.dart';
import '../../job_gloabelclass/job_icons.dart';
import '../job_theme/job_themecontroller.dart';

class JobApplicationStages extends StatelessWidget {
  //const JobApplicationStages({Key? key}) : super(key: key);
  Map<String,dynamic> application;

  JobApplicationStages({required this.application});

  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());
  @override
  Widget build(BuildContext context) {
    final status = application['status'];
    final jobDetails = application['jobDetails'];
    final jobTitle =
    jobDetails != null ? jobDetails['jobTitle'] : 'N/A';
    final location =
    jobDetails != null ? jobDetails['location'] : 'N/A';
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Application_Stages".tr,style: urbanistBold.copyWith(fontSize: 22 )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              Container(
                width: width / 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: themedata.isdark?JobColor.borderblack:JobColor.bggray,)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 36, vertical: height / 46),
                  child: Column(
                    children: [
                      Container(
                        height: height / 10,
                        width: height / 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: themedata.isdark?JobColor.borderblack:JobColor.bggray,)),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            JobPngimage.google,
                            height: height / 36,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 36,
                      ),
                      Text(
                        jobTitle,
                        style: urbanistSemiBold.copyWith(fontSize: 22),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Text(
                        "Google LLC".tr,
                        style: urbanistMedium.copyWith(
                            fontSize: 18, color: JobColor.appcolor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: height / 96,
                      ),
                       Divider(
                        color: themedata.isdark?JobColor.borderblack:JobColor.bggray,
                      ),
                      SizedBox(
                        height: height / 96,
                      ),
                      Text(
                        location,
                        style: urbanistMedium.copyWith(
                            fontSize: 18, color: JobColor.textgray),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: height / 66,
                      ),
                      Text(
                        "\$10,000 - \$25,000 /month".tr,
                        style: urbanistSemiBold.copyWith(
                            fontSize: 18, color: JobColor.appcolor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: height / 66,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: JobColor.textgray)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width / 26,
                                  vertical: height / 96),
                              child: Text("Full Time".tr,
                                  style: urbanistSemiBold.copyWith(
                                      fontSize: 10, color: JobColor.textgray)),
                            ),
                          ),
                          SizedBox(
                            width: width / 26,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: JobColor.textgray)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width / 26,
                                  vertical: height / 96),
                              child: Text("Onsite".tr,
                                  style: urbanistSemiBold.copyWith(
                                      fontSize: 10, color: JobColor.textgray)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 66,
                      ),
                      Text("Posted 10 days ago, ends in 31 Dec.".tr,
                          style: urbanistSemiBold.copyWith(
                              fontSize: 14, color: JobColor.textgray)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height / 26,
              ),
              Text("Your_Application_Status".tr,style: urbanistSemiBold.copyWith(fontSize: 18 )),
              SizedBox(
                height: height / 36,
              ),
              Container(
                height: height / 15,
                width: width / 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: JobColor.lightblue,
                ),
                child: Center(
                  child: Text("Application $status",
                      style: urbanistSemiBold.copyWith(
                          fontSize: 16,
                          color: JobColor.appcolor)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/56),
        child: InkWell(
          splashColor: JobColor.transparent,
          highlightColor: JobColor.transparent,
          onTap: () {
            if (status == "accepted") {
              // Navigate to the Calendar screen or any other screen you want
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarScreen()), // Replace CalendarScreen with your target screen
              );
            }
          },
          child: Container(
            height: height/15,
            width: width/1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: status == "accepted" ? Colors.green : JobColor.lightblue, // Changes color to green if status is accepted
            ),
            child: Center(
              child: Text(
                status == "accepted" ? "Go to Calendar" : "Waiting...", // Changes text based on status
                style: urbanistSemiBold.copyWith(fontSize: 16, color: JobColor.appcolor),
              ),
            ),
          ),
        ),
      ),

    );
  }
}
