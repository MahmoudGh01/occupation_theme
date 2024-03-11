import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import '../../../job_gloabelclass/job_fontstyle.dart';
import '../../../job_gloabelclass/job_icons.dart';
import '../../job_theme/job_themecontroller.dart';

class JobDeactivateAccount extends StatefulWidget {
  const JobDeactivateAccount({Key? key}) : super(key: key);

  @override
  State<JobDeactivateAccount> createState() => _JobDeactivateAccountState();
}

class _JobDeactivateAccountState extends State<JobDeactivateAccount> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());

  List color = [
    const Color(0x1A246BFD),
    const Color(0x1A246BFD),
    const Color(0x1AFF9800),
    const Color(0x1AF75555),
    const Color(0x1A4CAF50),
  ];

  List textcolor = [
    const Color(0xff246BFD),
    const Color(0xff246BFD),
    const Color(0xffFACC15),
    const Color(0xffF75555),
    const Color(0xff07BD74),
  ];

  List application = ["UI/UX Designer","Software Engineer","Application Developer","Web Designer","Graphic Designer"];
  List applicationdesc = ["Google LLC","Paypal","Figma","Twitter Inc.","Pinterest"];
  List applicationsicon = [
    JobPngimage.google,
    JobPngimage.paypal,
    JobPngimage.figma,
    JobPngimage.a4,
    JobPngimage.printrest,
  ];

  List status = ["Application Sent","Application Sent","Application Pending","Application Rejected","Application Accepted"];

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
              Text("DeactivateAccount".tr,style: urbanistBold.copyWith(fontSize: 28 )),
              SizedBox(height: height/96,),
              Text("You will lose all completed profiles and also all your job applications.".tr,textAlign: TextAlign.center,style: urbanistRegular.copyWith(fontSize: 16 )),
              SizedBox(height: height/26,),
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
                                  border: Border.all(color: JobColor.bggray)
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
                      const Divider(),
                      SizedBox(height: height/80,),
                    ],
                  );
                },
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

          },
          child: Container(
            height: height/15,
            width: width/1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color:JobColor.red,
            ),
            child: Center(
              child: Text("Deactivate".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:JobColor.white)),
            ),
          ),
        ),
      ),
    );
  }
}
