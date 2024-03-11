import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import 'package:job_seeker/job/job_pages/job_profile/job_setting/job_setting.dart';
import 'package:provider/provider.dart';
import '../../../providers/userprovider.dart';
import '../../../services/Auth.dart';
import '../../job_gloabelclass/job_fontstyle.dart';
import '../../job_gloabelclass/job_icons.dart';
import '../job_theme/job_themecontroller.dart';

import 'job_editprofile.dart';
import 'job_expectedsalary.dart';
import 'job_languages.dart';

import 'job_projects.dart';
import 'job_resume.dart';
import 'job_skills.dart';

class JobProfile extends StatefulWidget {
  const JobProfile({Key? key}) : super(key: key);

  @override
  State<JobProfile> createState() => _JobProfileState();
}

class _JobProfileState extends State<JobProfile> {
  AuthService auth = AuthService();
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context, listen: false).user;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(15),
          child: Image.asset(JobPngimage.logo,height: height/36,),
        ),
        title: Text("Profile".tr,style: urbanistBold.copyWith(fontSize: 22 )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
                splashColor: JobColor.transparent,
                highlightColor: JobColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const JobSetting();
                  },));
                },
                child: Image.asset(JobPngimage.setting,height: height/36,color: themedata.isdark? JobColor.white:JobColor.black,)),
          ),
        ],
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
                    backgroundImage: user.profilePicturePath.isNotEmpty
                        ? NetworkImage(user.profilePicturePath)
                        : const AssetImage('assets/job_assets/job_pngimage/logo.png') as ImageProvider,
                  ),
                  SizedBox(width: width/26,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height/120,),
                      Text(user.name,style: urbanistBold.copyWith(fontSize: 22 )),
                      SizedBox(height: height/120,),
                      Text(user.email,style: urbanistMedium.copyWith(fontSize: 15,color: JobColor.textgray)),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    splashColor: JobColor.transparent,
                    highlightColor: JobColor.transparent,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const JobEditprofile();
                        },));
                      },
                      child: Image.asset(JobPngimage.editicon,height: height/30,color: JobColor.appcolor))
                ],
              ),
              SizedBox(height: height/56,),
              const Divider(),
              SizedBox(height: height/56,),

              InkWell(
                splashColor: JobColor.transparent,
                highlightColor: JobColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const JobSkills();
                  },));
                },
                child: Container(
                  width: width/1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: themedata.isdark?JobColor.borderblack:JobColor.bggray)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/30,vertical: height/56),
                    child: Row(
                      children: [
                        Image.asset(JobPngimage.graph,height: height/36,color: JobColor.appcolor,),
                        SizedBox(width: width/36,),
                        Text("Skills".tr,style: urbanistBold.copyWith(fontSize: 18 )),
                        const Spacer(),
                        Image.asset(JobPngimage.plus,height: height/30,color: JobColor.appcolor),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height/46,),


              InkWell(
                splashColor: JobColor.transparent,
                highlightColor: JobColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const JobResume();
                  },));
                },
                child: Container(
                  width: width/1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: themedata.isdark?JobColor.borderblack:JobColor.bggray)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/30,vertical: height/56),
                    child: Row(
                      children: [
                        Image.asset(JobPngimage.paper,height: height/36,color: JobColor.appcolor,),
                        SizedBox(width: width/36,),
                        Text("CV_Resume".tr,style: urbanistBold.copyWith(fontSize: 18 )),
                        const Spacer(),
                        Image.asset(JobPngimage.plus,height: height/30,color: JobColor.appcolor),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height/46,),
              InkWell(
                splashColor: JobColor.transparent,
                highlightColor: JobColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const JobExpectedSalary();
                  },));
                },
                child: Container(
                  width: width/1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: themedata.isdark?JobColor.borderblack:JobColor.bggray)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/30,vertical: height/56),
                    child: Row(
                      children: [
                        Image.asset(JobPngimage.graph,height: height/36,color: JobColor.appcolor,),
                        SizedBox(width: width/36,),
                        Text("Expected_Salary".tr,style: urbanistBold.copyWith(fontSize: 18 )),
                        const Spacer(),
                        Image.asset(JobPngimage.plus,height: height/30,color: JobColor.appcolor),
                      ],
                    ),
                  ),
                ),
              ),



              SizedBox(height: height/46,),
              InkWell(
                splashColor: JobColor.transparent,
                highlightColor: JobColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const JobProjects();
                  },));
                },
                child: Container(
                  width: width/1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: themedata.isdark?JobColor.borderblack:JobColor.bggray)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/30,vertical: height/56),
                    child: Row(
                      children: [
                        Image.asset(JobPngimage.chart,height: height/36,color: JobColor.appcolor,),
                        SizedBox(width: width/36,),
                        Text("Projects".tr,style: urbanistBold.copyWith(fontSize: 18 )),
                        const Spacer(),
                        Image.asset(JobPngimage.plus,height: height/30,color: JobColor.appcolor),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height/46,),

              InkWell(
                splashColor: JobColor.transparent,
                highlightColor: JobColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const JobLanguages();
                  },));
                },
                child: Container(
                  width: width/1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: themedata.isdark?JobColor.borderblack:JobColor.bggray)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/30,vertical: height/56),
                    child: Row(
                      children: [
                        Image.asset(JobPngimage.document,height: height/36,color: JobColor.appcolor,),
                        SizedBox(width: width/36,),
                        Text("Languages".tr,style: urbanistBold.copyWith(fontSize: 18 )),
                        const Spacer(),
                        Image.asset(JobPngimage.plus,height: height/30,color: JobColor.appcolor),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: height/30,),
              Text("Add_Custom_Section".tr,style: urbanistBold.copyWith(fontSize: 16,color: JobColor.appcolor)),
            ],
          ),
        ),
      ),
    );
  }
}
