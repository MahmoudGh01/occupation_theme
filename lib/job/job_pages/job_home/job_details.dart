import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import '../../../JobApplication/ApplicationForm.dart';
import '../../../models/job_model.dart';
import '../../../services/job_service.dart';
import '../../../utils/globalColors.dart';
import '../../job_gloabelclass/job_fontstyle.dart';
import '../../job_gloabelclass/job_icons.dart';
import '../job_theme/job_themecontroller.dart';
import 'job_applyjob.dart';
import 'job_applyjobwithprofile.dart';

class JobDetails extends StatefulWidget {
  final JobModel job;
  final JobService jobService = JobService();

  JobDetails({required this.job});
 //JobDetails({Key? key}) : super(key: key);

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {

  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());
  int isselected = 0;
  List type = [
    "Job Description",
    "Minimum Qualifications",
    "Perks and Benefits",
    "Required Skills",
    "Jobs Summary",
    "About us"
  ];
  List perks = [
    "Medical / Health Insurance",
    "Medical, Prescription, or Vision Plans",
    "Performance Bonus",
    "Paid Sick Leave",
    "Paid Vacation Leave",
    "Transportation Allowances"
  ];
  List icon = [
    JobPngimage.g1,
    JobPngimage.p2,
    JobPngimage.p3,
    JobPngimage.p4,
    JobPngimage.p5,
    JobPngimage.p6,
  ];

  List skills = [
    "Creative Thinking",
    "UI/UX Design",
    "Figma",
    "Graphic Design",
    "Web Design",
    "Layout"
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  JobPngimage.save,
                  height: height / 36,
                  color: themedata.isdark ? JobColor.white : JobColor.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  JobPngimage.send,
                  height: height / 30,
                  color: themedata.isdark ? JobColor.white : JobColor.black,
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width / 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: themedata.isdark?JobColor.borderblack:JobColor.bggray)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 36, vertical: height / 46),
                  child: Column(
                    children: [
                      Container(
                        height: height / 10,
                        width: height / 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: themedata.isdark?JobColor.borderblack:JobColor.bggray)),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            JobPngimage.google,
                            height: height / 36,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 36,
                      ),
                      Text(
                        widget.job.jobTitle,
                        style: urbanistSemiBold.copyWith(fontSize: 22),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Text(
                        widget.job.companyInformation,
                        style: urbanistMedium.copyWith(
                            fontSize: 18, color: JobColor.appcolor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: height / 96,
                      ),
                      const Divider(
                        color: JobColor.bggray,
                      ),
                      SizedBox(
                        height: height / 96,
                      ),
                      Text(
                        widget.job.location,
                        style: urbanistMedium.copyWith(
                            fontSize: 18, color: JobColor.textgray),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: height / 66,
                      ),
                      Text(
                        widget.job.salaryCompensation,
                        style: urbanistSemiBold.copyWith(
                            fontSize: 18, color: JobColor.appcolor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: height / 66,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: JobColor.textgray)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width / 26,
                                  vertical: height / 96),
                              child: Text("Full Time".tr,
                                  style: urbanistSemiBold.copyWith(
                                      fontSize: 10, color: JobColor.textgray)),
                            ),
                          ),
                          SizedBox(
                            width: width / 26,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: JobColor.textgray)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width / 26,
                                  vertical: height / 96),
                              child: Text("Onsite".tr,
                                  style: urbanistSemiBold.copyWith(
                                      fontSize: 10, color: JobColor.textgray)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 66,
                      ),
                      Text("Posted 10 days ago, ends in 31 Dec.".tr,
                          style: urbanistSemiBold.copyWith(
                              fontSize: 14, color: JobColor.textgray)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height / 36,
              ),
              SizedBox(
                height: height / 15,
                child: ListView.separated(
                  itemCount: type.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: JobColor.transparent,
                      highlightColor: JobColor.transparent,
                      onTap: () {
                        setState(() {
                          isselected = index;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            type[index],
                            style: urbanistSemiBold.copyWith(
                                fontSize: 18,
                                color: isselected == index
                                    ? JobColor.appcolor
                                    : JobColor.textgray),
                          ),
                          SizedBox(
                            height: height / 96,
                          ),
                          Container(
                            color: isselected == index
                                ? JobColor.appcolor
                                : JobColor.transparent,
                            height: height / 300,
                            width: width / 3.5,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      width: width / 20,
                    );
                  },
                ),
              ),
              SizedBox(
                height: height / 66,
              ),
              if (isselected == 0) ...[
                Text(
                  "Job_Description".tr,
                  style: urbanistBold.copyWith(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: height / 40,
                ),
                Text(
                  widget.job.jobDescription,
                  style: urbanistMedium.copyWith(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: height / 120,
                ),
                Text(
                  "- Able to lead a team, delegate, & initiative.".tr,
                  style: urbanistMedium.copyWith(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: height / 120,
                ),
                Text(
                  "- Able to mold the junior designer to strategize how certain feature needs to be collected."
                      .tr,
                  style: urbanistMedium.copyWith(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: height / 120,
                ),
                Text(
                  "- Able to aggregate and be data minded on the decision that's taking place."
                      .tr,
                  style: urbanistMedium.copyWith(
                    fontSize: 16,
                  ),
                ),
              ] else if (isselected == 1) ...[
                Text(
                  "Minimum_Qualifications".tr,
                  style: urbanistBold.copyWith(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: height / 46,
                ),

                ...widget.job.requirements.map((requirement) => ListTile(
                  leading: Icon(Icons.check_circle_outline, color: GlobalColors.secondaryColor),
                  title: Text(requirement),
                )).toList(),
                SizedBox(
                  height: height / 120,
                ),

              ] else if (isselected == 2) ...[
                Text(
                  "Perks_and_Benefits".tr,
                  style: urbanistBold.copyWith(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: height / 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width / 26),
                  child: ListView.builder(
                    itemCount: icon.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: height / 46),
                        child: Row(
                          children: [
                            Image.asset(
                              icon[index],
                              height: height / 36,
                            ),
                            SizedBox(
                              width: width / 36,
                            ),
                            Text(
                              perks[index],
                              style: urbanistMedium.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ] else if (isselected == 3) ...[
                Text(
                  "Required_Skills".tr,
                  style: urbanistBold.copyWith(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: height / 40,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: skills.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 5,
                      childAspectRatio: (height / 1.5) / (width / 1.8)),
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: JobColor.transparent,
                      highlightColor: JobColor.transparent,
                      onTap: () {},
                      child: Container(
                        height: height / 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: JobColor.appcolor),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 16),
                          child: Center(
                            child: Text(skills[index],
                                style: urbanistSemiBold.copyWith(
                                    fontSize: 14, color: JobColor.appcolor)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ] else if (isselected == 4) ...[
                Text(
                  "Jobs_Summary".tr,
                  style: urbanistBold.copyWith(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: height / 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width / 2.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Job_Level".tr,
                              style: urbanistBold.copyWith(
                                fontSize: 16,
                              )),
                          SizedBox(
                            height: height / 96,
                          ),
                          Text(
                            "Associate / Supervisor".tr,
                            style: urbanistMedium.copyWith(
                                fontSize: 16, color: JobColor.appcolor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: width / 2.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Job_Category".tr,
                              style: urbanistBold.copyWith(
                                fontSize: 16,
                              )),
                          SizedBox(
                            height: height / 96,
                          ),
                          Text(
                            "IT and Software".tr,
                            style: urbanistMedium.copyWith(
                                fontSize: 16, color: JobColor.appcolor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height / 46,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width / 2.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Educational".tr,
                              style: urbanistBold.copyWith(
                                fontSize: 16,
                              )),
                          SizedBox(
                            height: height / 96,
                          ),
                          Text(
                            "Bachelor's Degree".tr,
                            style: urbanistMedium.copyWith(
                                fontSize: 16, color: JobColor.appcolor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: width / 2.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Experience".tr,
                              style: urbanistBold.copyWith(
                                fontSize: 16,
                              )),
                          SizedBox(
                            height: height / 96,
                          ),
                          Text(
                            "1 - 3 Years".tr,
                            style: urbanistMedium.copyWith(
                                fontSize: 16, color: JobColor.appcolor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height / 46,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width / 2.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Vacancy".tr,
                              style: urbanistBold.copyWith(
                                fontSize: 16,
                              )),
                          SizedBox(
                            height: height / 96,
                          ),
                          Text(
                            "2 opening".tr,
                            style: urbanistMedium.copyWith(
                                fontSize: 16, color: JobColor.appcolor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: width / 2.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Website".tr,
                              style: urbanistBold.copyWith(
                                fontSize: 16,
                              )),
                          SizedBox(
                            height: height / 96,
                          ),
                          Text(
                            "www.google.com".tr,
                            style: urbanistMedium.copyWith(
                                fontSize: 16, color: JobColor.appcolor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ] else if (isselected == 5) ...[
                Text(
                  "About".tr,
                  style: urbanistBold.copyWith(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: height / 40,
                ),
                Text(
                  "Google LLC is an American multinational technology company that focuses on search engine technology, online advertising, cloud computing, computer software, quantum computing, e-commerce, artificial intelligence, and consumer electronics."
                      .tr,
                  style: urbanistMedium.copyWith(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: height / 36,
                ),
                Text(
                  "Google was founded on September 4, 1998, by Larry Page and Sergey Brin while they were PhD students at Stanford University in California. Together they own about 14% of its publicly listed shares and control 56% of the stockholder voting power through super-voting stock."
                      .tr,
                  style: urbanistMedium.copyWith(
                    fontSize: 16,
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 56),
        child: InkWell(
          splashColor: JobColor.transparent,
          highlightColor: JobColor.transparent,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ApplicationForm(widget.job)));
          },
          child: Container(
            height: height / 15,
            width: width / 1,
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
      ),
    );
  }

  _showapplybottomsheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
                height: height / 4.8,
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
                        "Apply_Job".tr,
                        style: urbanistBold.copyWith(
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        height: height / 56,
                      ),
                      const Divider(),
                      SizedBox(
                        height: height / 56,
                      ),
                      Row(
                        children: [
                          InkWell(
                            splashColor: JobColor.transparent,
                            highlightColor: JobColor.transparent,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const JobApply();
                                },
                              ));
                            },
                            child: Container(
                              height: height / 15,
                              width: width / 2.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: JobColor.lightblue,
                              ),
                              child: Center(
                                child: Text("Apply_with_CV".tr,
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
                                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return const JobApplywithProfile();
                                  },));
                            },
                            child: Container(
                              height: height / 15,
                              width: width / 2.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: JobColor.appcolor,
                              ),
                              child: Center(
                                child: Text("Apply_with_Profile".tr,
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
