import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import '../../../job_gloabelclass/job_fontstyle.dart';
import '../../job_theme/job_themecontroller.dart';

class JobSeekingstatus extends StatefulWidget {
  const JobSeekingstatus({Key? key}) : super(key: key);

  @override
  State<JobSeekingstatus> createState() => _JobSeekingstatusState();
}

class _JobSeekingstatusState extends State<JobSeekingstatus> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());
  int isselected = 0;

  List title = ["Actively looking for jobs","Passively looking for jobs","Not looking for jobs"];
  List desc = ["I am actively looking for job right now, and I would like to accept job invitations.","I'm not looking for a job right now, but I am interested to accept job invitations.","I'm not looking for a job right now, please don't send me job invitations."];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Job_Seeking_Status".tr,style: urbanistBold.copyWith(fontSize: 22 )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              ListView.separated(
                itemCount: title.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: height/80),
                      child: InkWell(
                        splashColor: JobColor.transparent,
                        highlightColor: JobColor.transparent,
                        onTap: () {
                          setState(() {
                            isselected = index;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(isselected == index?Icons.radio_button_checked:Icons.radio_button_unchecked,size: 22,color: JobColor.appcolor,),
                            SizedBox(width: width/26,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(title[index],style: urbanistBold.copyWith(fontSize: 18 )),
                            SizedBox(height: height/120,),
                            SizedBox(
                              width: width/1.25,
                                child: Text(desc[index],style: urbanistMedium.copyWith(fontSize: 14 ),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(color: JobColor.bggray,);
                  },
                  )
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
              color:JobColor.appcolor,
            ),
            child: Center(
              child: Text("Save".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:JobColor.white)),
            ),
          ),
        ),
      ),
    );
  }
}
