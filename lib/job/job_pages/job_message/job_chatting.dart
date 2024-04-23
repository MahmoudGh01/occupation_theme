import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import 'package:job_seeker/job/job_gloabelclass/job_icons.dart';
import '../../job_gloabelclass/job_fontstyle.dart';
import '../job_theme/job_themecontroller.dart';

class JobChatting extends StatefulWidget {
  /*final String type;
  const JobChatting({super.key,required this.type});*/
  const JobChatting({Key? key}) : super(key: key);
  @override
  State<JobChatting> createState() => _JobChattingState();
}

class _JobChattingState extends State<JobChatting> {
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
        leadingWidth: width/10,
        title: Row(
          children: [
            Text("Google LLC",style: urbanistBold.copyWith(fontSize: 22)),
            const Spacer(),
            Image.asset(JobPngimage.call,height: height/36,color: themedata.isdark ? JobColor.white : JobColor.black),
            SizedBox(width: width/36,),
            Image.asset(JobPngimage.videoicon,height: height/36,color: themedata.isdark ? JobColor.white : JobColor.black),
            SizedBox(width: width/36,),
            InkWell(
              splashColor: JobColor.transparent,
              highlightColor: JobColor.transparent,
                onTap: () {
               /* if(widget.type == "1"){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ZomoAboutGroup();
                  },));
                }else{
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ZomoPersonalabout();
                  },));
                }*/
                },
                child: Image.asset(JobPngimage.more,height: height/36,color: themedata.isdark ? JobColor.white : JobColor.black)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/46),
          child: Column(
            children: [
              Container(
                height: height/30,
                width: width/6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: themedata.isdark?JobColor.lightblack:JobColor.appgray,
                ),
                child: Center(child: Text("Today",style: urbanistSemiBold.copyWith(fontSize: 10,color: JobColor.textgray))),
              ),
              SizedBox(height: height/36,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: width/1.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color:themedata.isdark?JobColor.lightblack:JobColor.appgray,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/66),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: width/2,
                                child: Text("Good morning. Thank you for applying for a UI/UX Designer job at Google LLC. We have reviewed your application and we are very impressed.",
                                  style: urbanistMedium.copyWith(fontSize: 16),),
                              ),
                              Text("09:41",style: urbanistMedium.copyWith(fontSize: 12,color: JobColor.textgray)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height/36,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: width/1.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: JobColor.appcolor
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/66),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: width/2,
                            child: Text("Hello, thank you for contacting me. I'm so glad you were impressed with my application 😁",
                              style: urbanistMedium.copyWith(fontSize: 16,color: JobColor.white),),
                          ),
                          Text("09:41",style: urbanistMedium.copyWith(fontSize: 12,color: JobColor.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height/36,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: width/1.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: JobColor.appcolor
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/66),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: width/2,
                            child: Text("I will definitely come on time and give my best",
                              style: urbanistMedium.copyWith(fontSize: 16,color: JobColor.white),),
                          ),
                          Text("09:41",style: urbanistMedium.copyWith(fontSize: 12,color: JobColor.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height/36,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: width/1.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: JobColor.appcolor
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/66),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: width/2,
                                child: Text("I attach my portfolio for you to look back 😄",
                                  style: urbanistMedium.copyWith(fontSize: 16,color: JobColor.white),),
                              ),
                              Text("09:42",style: urbanistMedium.copyWith(fontSize: 12,color: JobColor.white)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width/36,vertical: height/86),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width/1.3,
              child: TextFormField(
                cursorColor: JobColor.bggray,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                // controller: email,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.asset(JobPngimage.emoji,height: height/36,),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.asset(JobPngimage.camera,height: height/36,),
                    ),
                   fillColor: themedata.isdark?JobColor.lightblack:JobColor.appgray,
                    filled: true,
                    hintText: "Type a message ...".tr,
                    hintStyle: urbanistRegular.copyWith(fontSize: 14,color: JobColor.textgray),
                    border: const OutlineInputBorder(),
                    enabledBorder:  OutlineInputBorder(
                      borderSide:  BorderSide.none,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: const BorderSide(color: JobColor.appcolor),
                      borderRadius: BorderRadius.circular(24),
                    )),
              ),
            ),
            CircleAvatar(
              radius: 25,
              backgroundColor: JobColor.appcolor,
              child: Image.asset(JobPngimage.voice,height: height/36,),
            ),
          ],
        ),
      ),
    );
  }
}
