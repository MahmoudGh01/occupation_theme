import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import 'package:job_seeker/job/job_pages/job_theme/job_themecontroller.dart';
import '../../job_gloabelclass/job_fontstyle.dart';

class JobFilter extends StatefulWidget {
  const JobFilter({Key? key}) : super(key: key);

  @override
  State<JobFilter> createState() => _JobFilterState();
}

class _JobFilterState extends State<JobFilter> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());
  int isselected = 0;
  int isselected5 = 0;
  int? isselected3 = 0;
  List isselected2 = [];
  List isselected4 = [];
  List isselected6 = [];
  List isselected7 = [];
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  List type = ["Location & Salary","Work Type","Job Level","Employment Type","Experience","Education","Job Function"];

  List work = ["Onsite (Work from Office)","Remote (Work from Home)"];
  List joblevel = ["Internship / OJT","Entry Level / Junior, Apprentice","Associate / Supervisor","Mid-Senior Level / Manager","Director / Executive"];
  List employment = ["Full Time","Part Time","Freelance","Contractual"];
  List experience = ["No Experience","1 - 5 Years","6 - 10 Years","More Than 10 Years"];
  List education = ["Less Than High School","High School","Associate’s Degree","Bachelor’s Degree","Master’s Degree","Doctoral or Professional Degree"];
  List jobfunction = ["Accounting and Finance","Administration and Coordination","Architecture and Engineering","Arts and Sports","Customer Service","Education and Training","General Services","Health and Medical","Hospitality and Tourism","Human Resources","IT and Software","Legal","Management and Consultancy","Manufacturing and Production","Media and Creatives","Public Service and NGOs","Safety and Security","Sciences","Supply Chain","Writing and Content"];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          splashColor: JobColor.transparent,
          highlightColor: JobColor.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.close,size: 22,)),
        title: Text("Filter Options".tr,style: urbanistBold.copyWith(fontSize: 22 )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              ListView.builder(
                itemCount: type.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      splashColor: JobColor.transparent,
                      highlightColor: JobColor.transparent,
                      onTap: () {
                        setState(() {
                          isselected = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom:height/66),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: JobColor.bggray)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/46),
                          child: Row(
                            children: [
                              Text(type[index],style: urbanistBold.copyWith(fontSize: 20 )),
                              const Spacer(),
                               Icon(isselected == index ?Icons.keyboard_arrow_up: Icons.keyboard_arrow_down_rounded,size: 22,color: JobColor.appcolor,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    if(index == 0 && isselected == index)...[
                      Container(
                        margin: EdgeInsets.only(bottom:height/36),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: JobColor.bggray)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/66),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: JobColor.bggray
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/56),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.location_on,size: 22,),
                                      SizedBox(width: width/26,),
                                      Text("United States",style: urbanistRegular.copyWith(fontSize: 14 )),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: height/56,),
                              RangeSlider(
                                values: _currentRangeValues,
                                max: 100,
                                activeColor: JobColor.appcolor,
                                labels: RangeLabels(
                                  _currentRangeValues.start.round().toString(),
                                  _currentRangeValues.end.round().toString(),
                                ),
                                onChanged: (RangeValues values) {
                                  setState(() {
                                    _currentRangeValues = values;
                                  });
                                },
                              ),
                              SizedBox(height: height/56,),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: JobColor.bggray
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/56),
                                  child: Row(
                                    children: [
                                      Text("per month",style: urbanistRegular.copyWith(fontSize: 14 )),
                                      const Spacer(),
                                      const Icon(Icons.arrow_drop_down_sharp,size: 22,),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ]else if(index == 1 && isselected == index)...[
                      Container(
                        margin: EdgeInsets.only(bottom:height/36),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: JobColor.bggray)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/66 ),
                          child: ListView.separated(
                            itemCount: work.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                splashColor: JobColor.transparent,
                                highlightColor: JobColor.transparent,
                                onTap: () {
                                  setState(() {
                                    isselected3 = index;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(isselected3 == index?Icons.radio_button_checked:Icons.radio_button_unchecked,size: 22,color: JobColor.appcolor,),
                                    SizedBox(width: width/36,),
                                    Text(work[index],style: urbanistSemiBold.copyWith(fontSize: 16 ))
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Container(height: height/36,);
                            },
                          ),
                        ),
                      )
                    ]else if(index == 2 && isselected == index)...[
                      Container(
                        margin: EdgeInsets.only(bottom:height/36),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: JobColor.bggray)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/66 ),
                          child: ListView.separated(
                            itemCount: joblevel.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                splashColor: JobColor.transparent,
                                highlightColor: JobColor.transparent,
                                onTap: () {
                                  setState(() {
                                    if(isselected2.contains(index)){
                                      isselected2.remove(index);
                                    }else{
                                      isselected2.add(index);
                                    }
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(isselected2.contains(index) ?Icons.check_box:Icons.check_box_outline_blank,size: 22,color: JobColor.appcolor,),
                                    SizedBox(width: width/36,),
                                    Text(joblevel[index],style: urbanistSemiBold.copyWith(fontSize: 16 ))
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Container(height: height/36,);
                            },
                          ),
                        ),
                      )
                    ]else if(index == 3 && isselected == index)...[
                      Container(
                        margin: EdgeInsets.only(bottom:height/36),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: JobColor.bggray)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/66 ),
                          child: ListView.separated(
                            itemCount: employment.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                splashColor: JobColor.transparent,
                                highlightColor: JobColor.transparent,
                                onTap: () {
                                  setState(() {
                                    if(isselected4.contains(index)){
                                      isselected4.remove(index);
                                    }else{
                                      isselected4.add(index);
                                    }
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(isselected4.contains(index) ?Icons.check_box:Icons.check_box_outline_blank,size: 22,color: JobColor.appcolor,),
                                    SizedBox(width: width/36,),
                                    Text(employment[index],style: urbanistSemiBold.copyWith(fontSize: 16 ))
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Container(height: height/36,);
                            },
                          ),
                        ),
                      )
                    ]else if(index == 4 && isselected == index)...[
                      Container(
                        margin: EdgeInsets.only(bottom:height/36),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: JobColor.bggray)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/66 ),
                          child: ListView.separated(
                            itemCount: experience.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                splashColor: JobColor.transparent,
                                highlightColor: JobColor.transparent,
                                onTap: () {
                                  setState(() {
                                    isselected5 = index;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(isselected5 == index?Icons.radio_button_checked:Icons.radio_button_unchecked,size: 22,color: JobColor.appcolor,),
                                    SizedBox(width: width/36,),
                                    Text(experience[index],style: urbanistSemiBold.copyWith(fontSize: 16 ))
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Container(height: height/36,);
                            },
                          ),
                        ),
                      )
                    ]else if(index == 5 && isselected == index)...[
                      Container(
                        margin: EdgeInsets.only(bottom:height/36),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: JobColor.bggray)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/66 ),
                          child: ListView.separated(
                            itemCount: education.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                splashColor: JobColor.transparent,
                                highlightColor: JobColor.transparent,
                                onTap: () {
                                  setState(() {
                                    if(isselected6.contains(index)){
                                      isselected6.remove(index);
                                    }else{
                                      isselected6.add(index);
                                    }
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(isselected6.contains(index) ?Icons.check_box:Icons.check_box_outline_blank,size: 22,color: JobColor.appcolor,),
                                    SizedBox(width: width/36,),
                                    Text(education[index],style: urbanistSemiBold.copyWith(fontSize: 16 ))
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Container(height: height/36,);
                            },
                          ),
                        ),
                      )
                    ]else if(index == 6 && isselected == index)...[
                      Container(
                        margin: EdgeInsets.only(bottom:height/36),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: JobColor.bggray)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/66 ),
                          child: ListView.separated(
                            itemCount: jobfunction.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                splashColor: JobColor.transparent,
                                highlightColor: JobColor.transparent,
                                onTap: () {
                                  setState(() {
                                    if(isselected7.contains(index)){
                                      isselected7.remove(index);
                                    }else{
                                      isselected7.add(index);
                                    }
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(isselected7.contains(index) ?Icons.check_box:Icons.check_box_outline_blank,size: 22,color: JobColor.appcolor,),
                                    SizedBox(width: width/36,),
                                    Text(jobfunction[index],style: urbanistSemiBold.copyWith(fontSize: 16 ))
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Container(height: height/36,);
                            },
                          ),
                        ),
                      )
                    ]
                  ],
                );
              },)
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
        child: Row(
          children: [
            InkWell(
              splashColor: JobColor.transparent,
              highlightColor: JobColor.transparent,
              onTap: () {
              },
              child: Container(
                height: height / 15,
                width: width / 2.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: JobColor.lightblue,
                ),
                child: Center(
                  child: Text("Reset".tr,
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

              },
              child: Container(
                height: height / 15,
                width: width / 2.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: JobColor.appcolor,
                ),
                child: Center(
                  child: Text("Apply".tr,
                      style: urbanistSemiBold.copyWith(
                          fontSize: 16, color: JobColor.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
