import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import '../../job_gloabelclass/job_fontstyle.dart';
import '../../job_gloabelclass/job_icons.dart';
import '../job_theme/job_themecontroller.dart';

class JobSaveapplication extends StatefulWidget {
  const JobSaveapplication({Key? key}) : super(key: key);

  @override
  State<JobSaveapplication> createState() => _JobSaveapplicationState();
}

class _JobSaveapplicationState extends State<JobSaveapplication> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());

  int selected2 = 0;

  List jobs = ["Sales & Marketing","Writing & Content","Quality Assurance","Community Officer"];
 // List jobs = [];
  List jobdesc = ["Paypal","Pinterest","Spotify","Reddit Company"];
  List icon = [
    JobPngimage.paypal,
    JobPngimage.printrest,
    JobPngimage.spotify,
    JobPngimage.reddit,
  ];
  List location = ["New York, United States","Paris, France","Canberra, Australia","Tokyo, Japan"];

  List name = ["Alphabetical (A to Z)","Most Relevant","Highest Salary","Newly Posted","Ending Soon"];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(15),
          child: Image.asset(JobPngimage.logo,height: height/36,),
        ),
        title: Text("Saved_Jobs".tr,style: urbanistBold.copyWith(fontSize: 22 )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(JobPngimage.more,height: height/36,color: themedata.isdark?JobColor.white:JobColor.black,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              TextField(
                style: urbanistSemiBold.copyWith(fontSize: 16,),
                decoration: InputDecoration(
                  hintStyle: urbanistRegular.copyWith(fontSize: 16,color:JobColor.textgray,),
                  hintText: "Search".tr,
                 fillColor: themedata.isdark?JobColor.lightblack:JobColor.appgray,
                  filled: true,
                  prefixIcon:Icon(Icons.search_rounded,size: height/36,color: JobColor.textgray,),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(JobPngimage.filter,height: height/36,),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:const BorderSide(color: JobColor.appcolor)
                  ),
                ),
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
                        border: Border.all(color:themedata.isdark?JobColor.borderblack:JobColor.bggray,)
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
                                        InkWell(
                                          splashColor: JobColor.transparent,
                                          highlightColor: JobColor.transparent,
                                          onTap: () {
                                            _showremovebottomsheet();
                                          },
                                            child: Image.asset(JobPngimage.savefill,height: height/36,color: JobColor.appcolor,)),
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

  _showremovebottomsheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                    height: height / 1.9,
                    decoration: const BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width / 36, vertical: height / 56),
                      child: Column(
                        children: [
                          Text(
                            "Remove_from_Saved".tr,
                            style: urbanistBold.copyWith(
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(
                            height: height / 80,
                          ),
                          const Divider(),
                          SizedBox(
                            height: height / 56,
                          ),
                      Container(
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
                                        child: Image.asset(JobPngimage.a1,height: height/36,),
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
                                                child: Text("UI & UX Researcher",style: urbanistSemiBold.copyWith(fontSize: 20 ),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                            SizedBox(width: width/56,),
                                            Image.asset(JobPngimage.savefill,height: height/36,color: JobColor.appcolor,),
                                          ],
                                        ),
                                        SizedBox(height: height/80,),
                                        Text("Dribbble Inc.",style: urbanistMedium.copyWith(fontSize: 16 ),maxLines: 1,overflow: TextOverflow.ellipsis,),
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
                                        Text("Paris, France",style: urbanistMedium.copyWith(fontSize: 18 ),maxLines: 1,overflow: TextOverflow.ellipsis,),
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
                      ),
                          SizedBox(
                            height: height / 56,
                          ),
                          Row(
                            children: [
                              InkWell(
                                splashColor: JobColor.transparent,
                                highlightColor: JobColor.transparent,
                                onTap: () {
                                Navigator.pop(context);
                                },
                                child: Container(
                                  height: height / 15,
                                  width: width / 2.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: JobColor.lightblue,
                                  ),
                                  child: Center(
                                    child: Text("Cancel".tr,
                                        style: urbanistSemiBold.copyWith(
                                            fontSize: 16,
                                            color: JobColor.appcolor)),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                splashColor: JobColor.transparent,
                                highlightColor: JobColor.transparent,
                                onTap: () {
                                 /* Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return const JobApplywithProfile();
                                  },));*/
                                },
                                child: Container(
                                  height: height / 15,
                                  width: width / 2.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: JobColor.appcolor,
                                  ),
                                  child: Center(
                                    child: Text("Yes_Remove".tr,
                                        style: urbanistSemiBold.copyWith(
                                            fontSize: 16, color: JobColor.white)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ));
              });
        });
  }

}
