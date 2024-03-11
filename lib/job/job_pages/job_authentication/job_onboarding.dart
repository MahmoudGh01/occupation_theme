import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import 'package:job_seeker/job/job_gloabelclass/job_icons.dart';
import '../../job_gloabelclass/job_fontstyle.dart';
import 'package:nb_utils/nb_utils.dart';

import '../job_theme/job_themecontroller.dart';
import 'job_loginoption.dart';

class JobOnboarding extends StatefulWidget {
  const JobOnboarding({Key? key}) : super(key: key);

  @override
  State<JobOnboarding> createState() => _JobOnboardingState();
}

class _JobOnboardingState extends State<JobOnboarding> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  var pageController = PageController();
  List<Widget> pages = [];
  var selectedIndex = 0;
  final themedata = Get.put(JobThemecontroler());
  @override
  void initState() {
    super.initState();

  }


  init() async {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    pages = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height/14.5,),
          Image.asset(JobPngimage.screen1,height: height/2,fit: BoxFit.fitHeight,),
            const Spacer(),
          Container(
            height: height/2.35,
            width: width/1,
            decoration:  BoxDecoration(
              color: themedata.isdark?JobColor.lightblack:JobColor.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
              boxShadow: [
                BoxShadow(color: themedata.isdark?JobColor.lightblack:JobColor.textgray,blurRadius: 5),
              ]
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
              child: Column(
                children: [
                  SizedBox(height: height/46,),
                  Text("We are the best job portal platform",textAlign: TextAlign.center,style: urbanistBold.copyWith(fontSize: 36,color: JobColor.appcolor),maxLines: 2,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: height/46,),
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",textAlign: TextAlign.center,style: urbanistMedium.copyWith(fontSize: 16),maxLines: 2,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: height/11),
                  Container(
                    height: height/15,
                    width: width/1,
                    decoration: BoxDecoration(
                      color: JobColor.appcolor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(child: Text("Next".tr,style: urbanistBold.copyWith(fontSize: 16,color: JobColor.white),)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height/14.5,),
          Image.asset(JobPngimage.screen2,height: height/2,fit: BoxFit.fitHeight,),
          const Spacer(),
          Container(
            height: height/2.35,
            width: width/1,
            decoration:  BoxDecoration(
                color: themedata.isdark?JobColor.lightblack:JobColor.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(color: themedata.isdark?JobColor.lightblack:JobColor.textgray,blurRadius: 5),
                ]
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
              child: Column(
                children: [
                  SizedBox(height: height/46,),
                  Text("The place where work finds you",textAlign: TextAlign.center,style: urbanistBold.copyWith(fontSize: 36,color: JobColor.appcolor),maxLines: 2,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: height/46,),
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",textAlign: TextAlign.center,style: urbanistMedium.copyWith(fontSize: 16),maxLines: 2,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: height/11),
                  Container(
                    height: height/15,
                    width: width/1,
                    decoration: BoxDecoration(
                      color: JobColor.appcolor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(child: Text("Next".tr,style: urbanistBold.copyWith(fontSize: 16,color: JobColor.white),)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height/14.5,),
          Image.asset(JobPngimage.screen3,height: height/2,fit: BoxFit.fitHeight,),
          const Spacer(),
          Container(
            height: height/2.35,
            width: width/1,
            decoration:  BoxDecoration(
                color: themedata.isdark?JobColor.lightblack:JobColor.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(color: themedata.isdark?JobColor.lightblack:JobColor.textgray,blurRadius: 5),
                ]
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
              child: Column(
                children: [
                  SizedBox(height: height/46,),
                  Text("Let's start your career with us now!",textAlign: TextAlign.center,style: urbanistBold.copyWith(fontSize: 36,color: JobColor.appcolor),maxLines: 2,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: height/46,),
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",textAlign: TextAlign.center,style: urbanistMedium.copyWith(fontSize: 16),maxLines: 2,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: height/11),
                  InkWell(
                    splashColor: JobColor.transparent,
                    highlightColor: JobColor.transparent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const JobLoginoption();
                      },));
                    },
                    child: Container(
                      height: height/15,
                      width: width/1,
                      decoration: BoxDecoration(
                        color: JobColor.appcolor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(child: Text("Get_Started".tr,style: urbanistBold.copyWith(fontSize: 16,color: JobColor.white),)),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),

    ];
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    init();
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: pages,
            onPageChanged: (index) {
              selectedIndex = index;
              setState(() {});
            },
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            bottom: 105,
            left: 10,
            right: 10,
            child: DotIndicator(
                pageController: pageController,
                pages: pages,
                unselectedIndicatorColor: JobColor.grey,
                indicatorColor: JobColor.appcolor),
          ),
        ],
      ),
    );
  }
}
