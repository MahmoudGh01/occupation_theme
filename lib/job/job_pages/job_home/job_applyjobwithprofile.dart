import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import '../../job_gloabelclass/job_fontstyle.dart';
import '../../job_gloabelclass/job_icons.dart';
import '../job_theme/job_themecontroller.dart';

class JobApplywithProfile extends StatefulWidget {
  const JobApplywithProfile({Key? key}) : super(key: key);

  @override
  State<JobApplywithProfile> createState() => _JobApplywithProfileState();
}

class _JobApplywithProfileState extends State<JobApplywithProfile> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Apply_Job".tr,style: urbanistBold.copyWith(fontSize: 22 )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(JobPngimage.profile),
                  ),
                  SizedBox(width: width/26,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height/120,),
                      Text("Andrew Ainsley".tr,style: urbanistBold.copyWith(fontSize: 22 )),
                      SizedBox(height: height/120,),
                      Text("UI/UX Designer at Paypal Inc.".tr,style: urbanistMedium.copyWith(fontSize: 16,color: JobColor.textgray)),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(JobPngimage.editicon,height: height/30,)
                ],
              ),
              SizedBox(height: height/56,),
              const Divider(),
              SizedBox(height: height/56,),
              Container(
                width: width/1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: themedata.isdark?JobColor.borderblack:JobColor.bggray)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/30,vertical: height/56),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(JobPngimage.profileicon,height: height/40,color: JobColor.appcolor,),
                          SizedBox(width: width/36,),
                          Text("Contact_Information".tr,style: urbanistBold.copyWith(fontSize: 18 )),
                          const Spacer(),
                          Image.asset(JobPngimage.editicon,height: height/30,),
                        ],
                      ),
                      SizedBox(height: height/88,),
                      Divider(color: themedata.isdark?JobColor.borderblack:JobColor.bggray,),
                      SizedBox(height: height/88,),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined,size: 22,),
                          SizedBox(width: width/26,),
                          Text("New York, United States".tr,style: urbanistMedium.copyWith(fontSize: 16 )),
                        ],
                      ),
                      SizedBox(height: height/56,),
                      Row(
                        children: [
                          const Icon(Icons.call,size: 22,),
                          SizedBox(width: width/26,),
                          Text("+1 111 467 378 399".tr,style: urbanistMedium.copyWith(fontSize: 16 )),
                        ],
                      ),
                      SizedBox(height: height/56,),
                      Row(
                        children: [
                          const Icon(Icons.email_outlined,size: 22,),
                          SizedBox(width: width/26,),
                          Text("andrew_ainsley@yourdomain.com".tr,style: urbanistMedium.copyWith(fontSize: 16 )),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: height/36,),
              Container(
                width: width/1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: themedata.isdark?JobColor.borderblack:JobColor.bggray)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/30,vertical: height/56),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(JobPngimage.document,height: height/40,color: JobColor.appcolor,),
                          SizedBox(width: width/36,),
                          Text("Summary".tr,style: urbanistBold.copyWith(fontSize: 18 )),
                          const Spacer(),
                          Image.asset(JobPngimage.editicon,height: height/30,),
                        ],
                      ),
                      SizedBox(height: height/88,),
                      Divider(color: themedata.isdark?JobColor.borderblack:JobColor.bggray,),
                      SizedBox(height: height/56,),
                      Text("Hello, I'm Andrew. I am a designer with more than 5 years experience. My main fields are UI/UX Design, Illustration and Graphic Design. You can check the portfolio on my profile.".tr,style: urbanistRegular.copyWith(fontSize: 16 )),

                    ],
                  ),
                ),
              ),
              SizedBox(height: height/36,),
              Container(
                width: width/1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: themedata.isdark?JobColor.borderblack:JobColor.bggray)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/30,vertical: height/56),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(JobPngimage.graph,height: height/40,color: JobColor.appcolor,),
                          SizedBox(width: width/36,),
                          Text("Expected_Salary".tr,style: urbanistBold.copyWith(fontSize: 18 )),
                          const Spacer(),
                          Image.asset(JobPngimage.editicon,height: height/30,),
                        ],
                      ),
                      SizedBox(height: height/88,),
                      Divider(color: themedata.isdark?JobColor.borderblack:JobColor.bggray,),
                      SizedBox(height: height/56,),
                      Text("\$10,000 - \$25,000 /month".tr,style: urbanistSemiBold.copyWith(fontSize: 16 )),

                    ],
                  ),
                ),
              ),
              SizedBox(height: height/36,),
              Text("Add_Custom_Section".tr,style: urbanistBold.copyWith(fontSize: 18,color: JobColor.appcolor)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/56),
        child: InkWell(
          splashColor:JobColor.transparent,
          highlightColor:JobColor.transparent,
          onTap: () {
            //success();
            failed();
          },
          child: Container(
            height: height/15,
            width: width/1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color:JobColor.appcolor,
            ),
            child: Center(
              child: Text("Submit".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:JobColor.white)),
              ),
          ),
        ),
      ),
    );
  }

  success(){
    showDialog(
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/56),
              child: Column(
                children: [
                  Image.asset(JobPngimage.applysuccess,height: height/6,fit: BoxFit.fitHeight,),
                  SizedBox(height: height/30,),
                  Text("Congratulations".tr,style: urbanistBold.copyWith(fontSize: 24,color: JobColor.appcolor )),
                  SizedBox(height: height/46,),
                  Text("Your application has been successfully submitted. You can track the progress of your application through the applications menu.".tr,textAlign: TextAlign.center,style: urbanistRegular.copyWith(fontSize: 16)),
                  SizedBox(height: height/26,),
                  Container(
                    height: height/15,
                    width: width/1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:JobColor.appcolor,
                    ),
                    child: Center(
                      child: Text("Go_to_My_Applications".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:JobColor.white)),
                    ),
                  ),
                  SizedBox(height: height/56,),
                  InkWell(
                    splashColor:JobColor.transparent,
                    highlightColor:JobColor.transparent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height/15,
                      width: width/1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color:JobColor.lightblue,
                      ),
                      child: Center(
                        child: Text("Cancel".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:JobColor.appcolor)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        context: context);
  }

  failed(){
    showDialog(
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/56),
              child: Column(
                children: [
                  Image.asset(JobPngimage.applyfail,height: height/6,fit: BoxFit.fitHeight,),
                  SizedBox(height: height/30,),
                  Text("Oops, Failed!".tr,style: urbanistBold.copyWith(fontSize: 24,color: JobColor.red )),
                  SizedBox(height: height/46,),
                  Text("Please check your internet connection then try again.".tr,textAlign: TextAlign.center,style: urbanistRegular.copyWith(fontSize: 16)),
                  SizedBox(height: height/26,),
                  Container(
                    height: height/15,
                    width: width/1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:JobColor.appcolor,
                    ),
                    child: Center(
                      child: Text("Try_Again".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:JobColor.white)),
                    ),
                  ),
                  SizedBox(height: height/56,),
                  InkWell(
                    splashColor:JobColor.transparent,
                    highlightColor:JobColor.transparent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height/15,
                      width: width/1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color:JobColor.lightblue,
                      ),
                      child: Center(
                        child: Text("Cancel".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:JobColor.appcolor)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        context: context);
  }

}
