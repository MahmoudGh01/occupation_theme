import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import 'package:job_seeker/job/job_gloabelclass/job_icons.dart';

import '../../job_gloabelclass/job_fontstyle.dart';
import '../job_theme/job_themecontroller.dart';

class JobNotification extends StatefulWidget {
  const JobNotification({Key? key}) : super(key: key);

  @override
  State<JobNotification> createState() => _JobNotificationState();
}

class _JobNotificationState extends State<JobNotification> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());
  List jobs = ["Security Updates!","Password Updated","Jobee Has Updates!","New Updates Available!","Account Setup Successful!"];
  //List jobs = [];
  List icon = [
    JobPngimage.g1,
    JobPngimage.g2,
    JobPngimage.g3,
    JobPngimage.g4,
    JobPngimage.g5,
  ];
  List color = [
    const Color(0x1A246BFD),
    const Color(0x1A246BFD),
    const Color(0x1AFF9800),
    const Color(0x1AF75555),
    const Color(0x1A4CAF50),
  ];

  List desc = [
    "Now Jobee has a Two-Factor Authentication. Try it now to make your account more secure.",
    "You have updated your password. Contact the Help Center if you feel you are not doing it.",
    "You can now make multiple apply jobs at once. You can also cancel your applications.",
    "Update Jobee now to get access to the latest features and ease of applying for jobs.",
    "Your account creation is successful, you can now apply jobs with our services."
  ];

  List textcolor = [
    const Color(0xff246BFD),
    const Color(0xff246BFD),
    const Color(0xffFACC15),
    const Color(0xffF75555),
    const Color(0xff07BD74),
  ];

  List application = ["Product Management","UX Designer & Developer","Quality Assurance","Software Engineer","Network Administrator"];
  List applicationdesc = ["Dribbble Inc.","Sketch","AirBNB","Twitter Inc.","WeChat"];
  List applicationsicon = [
    JobPngimage.a1,
    JobPngimage.a2,
    JobPngimage.a3,
    JobPngimage.a4,
    JobPngimage.a5,
  ];

  List status = ["Application Sent","Application Sent","Application Pending","Application Rejected","Application Accepted"];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notification".tr,style: urbanistBold.copyWith(fontSize: 22 )),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(JobPngimage.more,height: height/36,color: themedata.isdark?JobColor.white:JobColor.black,),
            ),
          ],
          bottom: TabBar(
            indicatorColor: JobColor.appcolor,
            dividerColor: JobColor.bggray,
            labelColor: JobColor.appcolor,
            labelPadding: EdgeInsets.only(bottom: height/96),
            indicatorPadding: EdgeInsets.symmetric(horizontal: width/26),
            unselectedLabelColor: JobColor.textgray,
            unselectedLabelStyle:urbanistSemiBold.copyWith(fontSize: 18 ) ,
            labelStyle: urbanistSemiBold.copyWith(fontSize: 18 ) ,
            tabs: [
              Text("General".tr,),
              Text("Applications".tr,),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            if(jobs.isEmpty)...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(JobPngimage.empty,height: height/3.5,fit: BoxFit.fitHeight,),
                    SizedBox(height: height/16,),
                    Text("Empty".tr,style: urbanistSemiBold.copyWith(fontSize: 24 ),),
                    SizedBox(height: height/46,),
                    Text("You_dont_have_any_notifications_at_this_time".tr,style: urbanistRegular.copyWith(fontSize: 18 ),textAlign: TextAlign.center,),

                  ],
                ),
              )
            ]else...[
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
                  child: Column(
                    children: [
                      ListView.separated(
                        itemCount: jobs.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: JobColor.transparent,
                            highlightColor: JobColor.transparent,
                            onTap: () {
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: height/13,
                                      width: height/13,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: color[index]
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(18),
                                        child: Image.asset(icon[index],height: height/66,),
                                      ),
                                    ),
                                    SizedBox(width: width/26,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                                width: width/1.8,
                                                child: Text(jobs[index],style: urbanistSemiBold.copyWith(fontSize: 19 ),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                          ],
                                        ),
                                        SizedBox(height: height/80,),
                                        Text("20 Dec, 2022 | 20:49 PM",style: urbanistRegular.copyWith(fontSize: 14 ),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                      ],
                                    ),
                                    const Spacer(),
                                    if(index == 0 || index == 1)...[
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6),
                                            color: JobColor.appcolor
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/110),
                                          child: Text("New".tr,style: urbanistSemiBold.copyWith(fontSize: 10,color: JobColor.white)),
                                        ),
                                      ),
                                    ],

                                  ],
                                ),
                                SizedBox(height: height/40,),
                                Text(desc[index],style: urbanistRegular.copyWith(fontSize: 15,)),

                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Column(
                            children: [
                              SizedBox(height: height/80,),
                              Divider(color: themedata.isdark?JobColor.borderblack:JobColor.bggray,),
                              SizedBox(height: height/80,),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
                child: Column(
                  children: [
                    ListView.separated(
                      itemCount: application.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: JobColor.transparent,
                          highlightColor: JobColor.transparent,
                          onTap: () {
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: height/13,
                                    width: height/13,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(color: themedata.isdark?JobColor.borderblack:JobColor.bggray)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Image.asset(applicationsicon[index],height: height/36,),
                                    ),
                                  ),
                                  SizedBox(width: width/26,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: width/1.8,
                                              child: Text(application[index],style: urbanistSemiBold.copyWith(fontSize: 19 ),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                        ],
                                      ),
                                      SizedBox(height: height/80,),
                                      Text(applicationdesc[index],style: urbanistMedium.copyWith(fontSize: 16 ,color: JobColor.textgray),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                    ],
                                  ),
                                  const Spacer(),
                                  Icon(Icons.arrow_forward_ios,size: height/46,)
                                ],
                              ),
                              SizedBox(height: height/80,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: height/20,
                                    width: height/13,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(color: JobColor.transparent)
                                    ),
                                  ),
                                  SizedBox(width: width/26,),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: color[index]
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/110),
                                      child: Text(status[index],style: urbanistSemiBold.copyWith(fontSize: 10,color: textcolor[index])),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Column(
                          children: [
                            Divider(color:themedata.isdark?JobColor.borderblack:JobColor.bggray),
                            SizedBox(height: height/80,),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
