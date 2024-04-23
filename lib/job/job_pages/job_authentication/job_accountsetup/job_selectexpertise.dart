import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import '../../../job_gloabelclass/job_fontstyle.dart';
import '../../job_theme/job_themecontroller.dart';
import 'job_fillprofile.dart';

class JobSelectexpertise extends StatefulWidget {
  const JobSelectexpertise({Key? key}) : super(key: key);

  @override
  State<JobSelectexpertise> createState() => _JobSelectexpertiseState();
}

class _JobSelectexpertiseState extends State<JobSelectexpertise> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());
  List isselected = [];

  List expertise = [
    "Accounting and Finance",
    "Architecture and Engineering",
    "Information Technology and Software",
    "Management and Consultancy",
    "Media, Design, and Creatives",
    "Sales and Marketing",
    "Writing and Content"
  ];

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
              Text("What_is_Your_Expertise".tr,style: urbanistBold.copyWith(fontSize: 30 )),
              SizedBox(height: height/46,),
              Text("Please select your field of expertise (up to 5)".tr,style: urbanistRegular.copyWith(fontSize: 17 )),
              SizedBox(height: height/96,),
              const Divider(),
              SizedBox(height: height/56,),
              ListView.separated(
                itemCount: expertise.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: JobColor.transparent,
                    highlightColor: JobColor.transparent,
                    onTap: () {
                      setState(() {
                        if(isselected.contains(index)){
                          isselected.remove(index);
                        }else{
                          isselected.add(index);
                        }
                      });
                    },
                    child: Container(
                      width: width/1,
                      decoration: BoxDecoration(
                          border: Border.all(color:isselected.contains(index) ? JobColor.appcolor:themedata.isdark?JobColor.borderblack:JobColor.bggray,),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/46),
                        child: Row(
                          children: [
                            Icon(isselected.contains(index) ? Icons.check_box:Icons.check_box_outline_blank,size: 22,color: JobColor.appcolor,),
                            SizedBox(width: width/36,),
                            Text(expertise[index],style: urbanistSemiBold.copyWith(fontSize: 16 ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(height: height/56,);
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
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const JobFillProfile();
            },));
          },
          child: Container(
            height: height/15,
            width: width/1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color:JobColor.appcolor,
            ),
            child: Center(
              child: Text("Continue".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:JobColor.white)),
            ),
          ),
        ),
      ),
    );
  }
}
