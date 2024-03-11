import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import 'package:job_seeker/job/job_gloabelclass/job_icons.dart';
import '../../../job_gloabelclass/job_fontstyle.dart';
import '../../job_theme/job_themecontroller.dart';
import 'job_setfacerecognition.dart';

class JobSetfingerprint extends StatefulWidget {
  const JobSetfingerprint({Key? key}) : super(key: key);

  @override
  State<JobSetfingerprint> createState() => _JobSetfingerprintState();
}

class _JobSetfingerprintState extends State<JobSetfingerprint> {
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
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
        child: Column(
          children: [
            Text("Set_Your_Fingerprint".tr,style: urbanistBold.copyWith(fontSize: 30 )),
            SizedBox(height: height/46,),
            Text("Add_a_fingerprint_to_make_your_account_more_secure".tr,textAlign: TextAlign.center,style: urbanistRegular.copyWith(fontSize: 17 )),
            SizedBox(height: height/12,),
            Image.asset(JobPngimage.fingarprinticon,height: height/4,fit: BoxFit.fitHeight,color: JobColor.appcolor,),
            SizedBox(height: height/8,),
            Text("Please_put_your_finger_on_the_fingerprint_scanner_to_get_started".tr,textAlign: TextAlign.center,style: urbanistRegular.copyWith(fontSize: 17 )),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/56),
        child: Row(
          children: [
            InkWell(
              splashColor:JobColor.transparent,
              highlightColor:JobColor.transparent,
              onTap: () {
                /* Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const JobSelectexpertise();
                },));*/
              },
              child: Container(
                height: height/15,
                width: width/2.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:JobColor.lightblue,
                ),
                child: Center(
                  child: Text("Skip".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:JobColor.appcolor)),
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              splashColor:JobColor.transparent,
              highlightColor:JobColor.transparent,
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const JobSetFaceRecognition();
                },));
              },
              child: Container(
                height: height/15,
                width: width/2.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:JobColor.appcolor,
                ),
                child: Center(
                  child: Text("Continue".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:JobColor.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
