import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import '../../job_gloabelclass/job_fontstyle.dart';
import '../../job_gloabelclass/job_icons.dart';
import '../job_theme/job_themecontroller.dart';

class JobApply extends StatefulWidget {
  const JobApply({Key? key}) : super(key: key);

  @override
  State<JobApply> createState() => _JobApplyState();
}

class _JobApplyState extends State<JobApply> {
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Apply_Job".tr,style: urbanistBold.copyWith(fontSize: 22 )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Full_name".tr,style: urbanistMedium.copyWith(fontSize: 16 )),
              SizedBox(height: height/66,),
              TextField(
                style: urbanistSemiBold.copyWith(fontSize: 16),
                decoration: InputDecoration(
                  hintStyle: urbanistRegular.copyWith(fontSize: 16,color:JobColor.textgray,),
                  hintText: "Full_name".tr,
                 fillColor: themedata.isdark?JobColor.lightblack:JobColor.appgray,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: JobColor.appcolor)
                  ),
                ),
              ),
              SizedBox(height: height/46,),
              Text("Email".tr,style: urbanistMedium.copyWith(fontSize: 16 )),
              SizedBox(height: height/66,),
              TextField(
                style: urbanistSemiBold.copyWith(fontSize: 16,),
                decoration: InputDecoration(
                  hintStyle: urbanistRegular.copyWith(fontSize: 16,color:JobColor.textgray,),
                  hintText: "Email".tr,
                 fillColor: themedata.isdark?JobColor.lightblack:JobColor.appgray,
                  filled: true,
                  suffixIcon:Icon(Icons.email_outlined,size: height/46,),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: JobColor.appcolor)
                  ),
                ),
              ),
              SizedBox(height: height/46,),
              Text("Upload_CV_Resume".tr,style: urbanistMedium.copyWith(fontSize: 16 )),
              SizedBox(height: height/66,),
              Container(
                width: width/1,
                height: height/6,
                decoration: BoxDecoration(
                  color: themedata.isdark?JobColor.lightblack:JobColor.bggray,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(JobPngimage.uploadfile,height: height/26,),
                    SizedBox(height: height/36,),
                    Text("Browse_File".tr,style: urbanistSemiBold.copyWith(fontSize: 14,color: JobColor.textgray)),
                  ],
                ),
              ),
              SizedBox(height: height/46,),
              Text("Motivation_Letter".tr,style: urbanistMedium.copyWith(fontSize: 16 )),
              SizedBox(height: height/66,),
              TextField(
                maxLines: 5,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                decoration: InputDecoration(
                  hintStyle: urbanistRegular.copyWith(fontSize: 16,color:JobColor.textgray,),
                  hintText: "Motivation letter...".tr,
                 fillColor: themedata.isdark?JobColor.lightblack:JobColor.appgray,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: JobColor.appcolor)
                  ),
                ),
              ),
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
                  Image.asset(JobPngimage.successlogo,height: height/6,fit: BoxFit.fitHeight,),
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
                        child: Text("redirect".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:JobColor.appcolor)),
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
