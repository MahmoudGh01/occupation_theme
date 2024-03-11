import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import 'package:job_seeker/job/job_gloabelclass/job_icons.dart';
import '../../../job_gloabelclass/job_fontstyle.dart';
import '../../job_theme/job_themecontroller.dart';

class JobSetFaceRecognition extends StatefulWidget {
  const JobSetFaceRecognition({Key? key}) : super(key: key);

  @override
  State<JobSetFaceRecognition> createState() => _JobSetFaceRecognitionState();
}

class _JobSetFaceRecognitionState extends State<JobSetFaceRecognition> {
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
            Text("Face_Recognition".tr,style: urbanistBold.copyWith(fontSize: 30 )),
            SizedBox(height: height/46,),
            Text("Add a face recognition to make your account more secure.".tr,textAlign: TextAlign.center,style: urbanistRegular.copyWith(fontSize: 17 )),
            SizedBox(height: height/8,),
            Image.asset(JobPngimage.face,height: height/3,fit: BoxFit.fitHeight,),
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
                success();
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

  success(){
    showDialog(
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/56),
              child: Column(
                children: [
                  Image.asset(JobPngimage.acountsuccess,height: height/6,fit: BoxFit.fitHeight,),
                  SizedBox(height: height/30,),
                  Text("Congratulations".tr,style: urbanistBold.copyWith(fontSize: 24,color: JobColor.appcolor )),
                  SizedBox(height: height/46,),
                  Text("Your account is ready to use. You will be redirected to the Home page in a few seconds..".tr,textAlign: TextAlign.center,style: urbanistRegular.copyWith(fontSize: 16)),
                  SizedBox(height: height/26,),
                  Image.asset(JobPngimage.processer,height: height/15,fit: BoxFit.fitHeight,),
                ],
              ),
            )
          ],
        ),
        context: context);
  }

}
