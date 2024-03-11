import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import '../../../job_gloabelclass/job_fontstyle.dart';
import '../../job_theme/job_themecontroller.dart';

class JobLanguagesetting extends StatefulWidget {
  const JobLanguagesetting({Key? key}) : super(key: key);

  @override
  State<JobLanguagesetting> createState() => _JobLanguagesettingState();
}

class _JobLanguagesettingState extends State<JobLanguagesetting> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());
  int isselected = 0;
  int? isselected2;

  List l1 = ["English (US)","English (UK)"];
  List l2 = ["Mandarin","Hindi","Spanish","French","Arabic","Bengali","Russian","Indonesia"];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Language".tr,style: urbanistBold.copyWith(fontSize: 22 )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Suggested".tr,style: urbanistBold.copyWith(fontSize: 20 )),
              SizedBox(height: height/26,),
              ListView.separated(
                itemCount: l1.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: JobColor.transparent,
                    highlightColor: JobColor.transparent,
                    onTap: () {
                      setState(() {
                        isselected = index;
                      });
                    },
                    child: Row(
                      children: [
                        Text(l1[index],style: urbanistSemiBold.copyWith(fontSize: 18 )),
                        const Spacer(),
                        Icon(isselected == index?Icons.radio_button_checked:Icons.radio_button_unchecked,size: 22,color: JobColor.appcolor,),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(height: height/26,);
                },
              ),
              SizedBox(height: height/36,),
              const Divider(),
              SizedBox(height: height/56,),
              Text("Language".tr,style: urbanistBold.copyWith(fontSize: 20 )),
              SizedBox(height: height/26,),
              ListView.separated(
                itemCount: l2.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: JobColor.transparent,
                    highlightColor: JobColor.transparent,
                    onTap: () {
                      setState(() {
                        isselected2 = index;
                      });
                    },
                    child: Row(
                      children: [
                        Text(l2[index],style: urbanistSemiBold.copyWith(fontSize: 18 )),
                        const Spacer(),
                        Icon(isselected2 == index?Icons.radio_button_checked:Icons.radio_button_unchecked,size: 22,color: JobColor.appcolor,),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(height: height/26,);
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
