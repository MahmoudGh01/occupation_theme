import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import 'package:job_seeker/job/job_gloabelclass/job_icons.dart';
import 'package:job_seeker/job/job_pages/job_authentication/job_accountsetup/qrcode_auth.dart';
import 'package:job_seeker/job/job_pages/job_home/job_dashboard.dart';
import '../../../job_gloabelclass/job_fontstyle.dart';
import '../../job_theme/job_themecontroller.dart';
import 'job_selectexpertise.dart';

class JobChoosejobtype extends StatefulWidget {
  const JobChoosejobtype({Key? key}) : super(key: key);

  @override
  State<JobChoosejobtype> createState() => _JobChoosejobtypeState();
}

class _JobChoosejobtypeState extends State<JobChoosejobtype> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());
  int isselected = 0;

  List type = ["Find a Job","Find an Employee"];
  List desc = ["I want to find a\njob for me.","I want to find\nemployees."];
  List img = [
    JobPngimage.union,
    JobPngimage.profileicon,
  ];
  List color = [const Color(0x1A2B3499),const Color(0x1AFF9800)];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              Image.asset(JobPngimage.logo,height: height/6,fit: BoxFit.fitHeight,),
              SizedBox(height: height/36,),
              Text("Choose_Your_Job_Type".tr,textAlign: TextAlign.center,style: urbanistBold.copyWith(fontSize: 30 )),
              SizedBox(height: height/36,),
              Text("Choose whether you are looking for a job or you are an organization/company that needs employees.".tr,textAlign: TextAlign.center,style: urbanistRegular.copyWith(fontSize: 18 )),
              SizedBox(height: height/96,),
              const Divider(),
              SizedBox(height: height/96,),
              SizedBox(
                height: height/3,
                child: ListView.separated(
                  itemCount: img.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: JobColor.transparent,
                        highlightColor: JobColor.transparent,
                        onTap: () {
                          setState(() {
                            isselected = index;
                          });
                        },
                        child: Container(
                          width: width/2.2,
                          height: height/3,
                          decoration: BoxDecoration(
                            border: Border.all(color:isselected == index? JobColor.appcolor:themedata.isdark?JobColor.borderblack:JobColor.bggray,),
                            borderRadius: BorderRadius.circular(40)
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/46,vertical: height/36),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: color[index],
                                  child: Image.asset(img[index],height: height/26),
                                ),
                                SizedBox(height: height/36,),
                                Text(type[index],textAlign: TextAlign.center,style: urbanistBold.copyWith(fontSize: 20),maxLines: 2,overflow: TextOverflow.ellipsis),
                                SizedBox(height: height/36,),
                                Text(desc[index],textAlign: TextAlign.center,style: urbanistMedium.copyWith(fontSize: 14,color: JobColor.textgray),maxLines: 2,overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(width: width/36,);
                    },

                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/36, vertical: height/56),
        child: InkWell(
          splashColor: JobColor.transparent,
          highlightColor: JobColor.transparent,
          onTap: () {
            if (isselected == 1) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return QRViewExample();  // Assuming QrCodeView is the page for finding employees
              }));
            } else {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return JobDashboard("0");  // Assuming JobDashboard is the page for job seekers
              }));
            }
          },
          child: Container(
            height: height/15,
            width: width/1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: JobColor.appcolor,
            ),
            child: Center(
              child: Text("Continue".tr, style: urbanistSemiBold.copyWith(fontSize: 16, color: JobColor.white)),
            ),
          ),
        ),
      ),

    );
  }
}
