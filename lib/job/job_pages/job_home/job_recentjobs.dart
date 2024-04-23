import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';

import '../../job_gloabelclass/job_fontstyle.dart';
import '../../job_gloabelclass/job_icons.dart';
import '../job_theme/job_themecontroller.dart';

class JobRecentJobs extends StatefulWidget {
  const JobRecentJobs({Key? key}) : super(key: key);

  @override
  State<JobRecentJobs> createState() => _JobRecentJobsState();
}

class _JobRecentJobsState extends State<JobRecentJobs> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());

  List text = ["All", "Design", "Technology", "Finance"];
  int selected1 = 0;
  int selected2 = 0;

  List jobs = ["Sales & Marketing","Writing & Content","Quality Assurance","Community Officer"];
  List jobdesc = ["Paypal","Pinterest","Spotify","Reddit Company"];
  List icon = [
    JobPngimage.paypal,
    JobPngimage.printrest,
    JobPngimage.spotify,
    JobPngimage.reddit,
  ];
  List location = ["New York, United States","Paris, France","Canberra, Australia","Tokyo, Japan"];


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Recent_Jobs".tr,style: urbanistBold.copyWith(fontSize: 22 )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Image.asset(JobPngimage.search,height: height/96,color: themedata.isdark?JobColor.white:JobColor.black,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              SizedBox(
                height: height / 20,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: JobColor.transparent,
                        highlightColor: JobColor.transparent,
                        onTap: () {
                          setState(() {
                            selected1 = index;
                          });
                        },
                        child: Container(
                          height: height / 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all( color: selected1 == index
                                  ? JobColor.transparent
                                  : JobColor.appcolor),
                              color: selected1 == index
                                  ? JobColor.appcolor
                                  : JobColor.transparent),
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: width / 16),
                            child: Center(
                              child: Text(text[index],
                                  style: urbanistMedium.copyWith(
                                      fontSize: 16,
                                      color: selected1 == index
                                          ? JobColor.white
                                          : JobColor.appcolor)),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        width: width / 36,
                      );
                    },
                    itemCount: text.length),
              ),
              SizedBox(height: height/36,),
              ListView.separated(
                itemCount: jobs.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    width: width/1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: themedata.isdark?JobColor.borderblack:JobColor.bggray)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/46),
                      child: InkWell(
                        splashColor: JobColor.transparent,
                        highlightColor: JobColor.transparent,
                        onTap: () {
                          setState(() {
                            selected2 = index;
                          });
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: height/12,
                                  width: height/12,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: themedata.isdark?JobColor.borderblack:JobColor.bggray)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Image.asset(icon[index],height: height/36,),
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
                                            child: Text(jobs[index],style: urbanistSemiBold.copyWith(fontSize: 20 ),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                        SizedBox(width: width/56,),
                                        Image.asset(selected2 == index?JobPngimage.savefill:JobPngimage.save,height: height/36,color: JobColor.appcolor,),
                                      ],
                                    ),
                                    SizedBox(height: height/80,),
                                    Text(jobdesc[index],style: urbanistMedium.copyWith(fontSize: 16 ),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                  ],
                                ),

                              ],
                            ),
                            SizedBox(height: height/96,),
                             Divider(color: themedata.isdark?JobColor.borderblack:JobColor.bggray),
                            SizedBox(height: height/96,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: height/12,
                                  width: height/12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                SizedBox(width: width/26,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(location[index],style: urbanistMedium.copyWith(fontSize: 18 ),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                    SizedBox(height: height/66,),
                                    Text("\$10,000 - \$25,000 /month".tr,style: urbanistSemiBold.copyWith(fontSize: 18,color: JobColor.appcolor),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                    SizedBox(height: height/66,),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(6),
                                              border: Border.all(color: JobColor.textgray)
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/96),
                                            child: Text("Full Time".tr,style: urbanistSemiBold.copyWith(fontSize: 10,color: JobColor.textgray)),
                                          ),
                                        ),
                                        SizedBox(width: width/26,),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(6),
                                              border: Border.all(color: JobColor.textgray)
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/96),
                                            child: Text("Onsite".tr,style: urbanistSemiBold.copyWith(fontSize: 10,color: JobColor.textgray)),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(height: height/46,);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
