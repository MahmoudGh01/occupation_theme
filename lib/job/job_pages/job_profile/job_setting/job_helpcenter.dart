import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import 'package:job_seeker/job/job_gloabelclass/job_icons.dart';
import '../../../job_gloabelclass/job_fontstyle.dart';
import '../../job_theme/job_themecontroller.dart';

class Step {
  Step(this.title, [this.isExpanded = false]);

  String title;
  bool isExpanded;
}

List<Step> getSteps() {
  return [
    Step('What is Jobee?'),
    Step('How to apply a job?'),
    Step('How do I complete my profile?'),
    Step('How do I can delete my account?'),
    Step('How do I exit the app?'),
  ];
}

class JobHelpcenter extends StatefulWidget {
  const JobHelpcenter({Key? key}) : super(key: key);

  @override
  State<JobHelpcenter> createState() => _JobHelpcenterState();
}

class _JobHelpcenterState extends State<JobHelpcenter> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());
  List<String> faqtext = ["General","Account","Service","Payment"];
  int selected = 0;
  final List<Step> _steps = getSteps();
  
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: width/10,
          toolbarHeight: height/13,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Help_Center".tr,style: urbanistBold.copyWith(fontSize: 22)),
              Image.asset(JobPngimage.more,height: height/30,color: themedata.isdark ? JobColor.white : JobColor.black),
            ],
          ),
          bottom: TabBar(
              dividerColor: JobColor.bggray,
              unselectedLabelStyle: urbanistSemiBold.copyWith(fontSize: 18),
              labelStyle: urbanistSemiBold.copyWith(fontSize: 18),
              indicatorColor: JobColor.appcolor,
              labelPadding: EdgeInsets.symmetric(vertical: height/56),
              unselectedLabelColor: JobColor.textgray,
              labelColor: JobColor.appcolor,
              tabs: [
                Text("FAQ".tr),
                Text("Contact_us".tr),
              ]),
        ),
        body: TabBarView(
            children: [
              SingleChildScrollView(
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
                                      selected = index;
                                    });
                                  },
                                  child: Container(
                                    height: height / 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all( color: selected == index
                                            ? JobColor.transparent
                                            : JobColor.appcolor),
                                        color: selected == index
                                            ? JobColor.appcolor
                                            : JobColor.transparent),
                                    child: Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: width / 16),
                                      child: Center(
                                        child: Text(faqtext[index],
                                            style: urbanistMedium.copyWith(
                                                fontSize: 16,
                                                color: selected == index
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
                              itemCount: faqtext.length),
                        ),
                        SizedBox(height: height/36),
                        TextField(
                          style: urbanistSemiBold.copyWith(fontSize: 16,color: JobColor.black,),
                          decoration: InputDecoration(
                            hintStyle: urbanistRegular.copyWith(fontSize: 16,color:JobColor.textgray,),
                            hintText: "Faq".tr,
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
                        SizedBox(height: height/36),
                        ExpansionPanelList(
                          expansionCallback: (int index, bool isExpanded) {
                            setState(() {
                              _steps[index].isExpanded  = !isExpanded;
                            });
                          },
                          children: _steps.map<ExpansionPanel>((Step step) {
                            return ExpansionPanel(
                              canTapOnHeader: false,
                              backgroundColor: themedata.isdark
                                  ? JobColor.lightblack
                                  : JobColor.container,
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  minLeadingWidth: 0.8,
                                  iconColor: JobColor.appcolor,
                                  title: Text(step.title,
                                      style: urbanistBold.copyWith(fontSize: 18)),
                                );
                              },
                              body: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: width/26,vertical: height/66),
                                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                  style: urbanistMedium.copyWith(fontSize: 14,
                                      color: themedata.isdark ? JobColor.white : JobColor.black),),
                              ),
                              isExpanded: step.isExpanded,
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
                    child: Column(
                      children: [
                        Container(
                          height: height/12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: themedata.isdark ? JobColor.lightblack : JobColor.container,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/26),
                            child: Row(
                              children: [
                                Image.asset(JobPngimage.service,height: height/36,width: height/36),
                                SizedBox(width: width/26),
                                Text("Customer_Service".tr,style: urbanistBold.copyWith(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height/46),
                        Container(
                          height: height/12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: themedata.isdark ? JobColor.lightblack : JobColor.container,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/26),
                            child: Row(
                              children: [
                                Image.asset(JobPngimage.whatapp,height: height/36,width: height/36),
                                SizedBox(width: width/26),
                                Text("WhatsApp".tr,style: urbanistBold.copyWith(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height/46),
                        Container(
                          height: height/12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: themedata.isdark ? JobColor.lightblack : JobColor.container,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/26),
                            child: Row(
                              children: [
                                Image.asset(JobPngimage.website,height: height/36,width: height/36),
                                SizedBox(width: width/26),
                                Text("Website".tr,style: urbanistBold.copyWith(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height/46),
                        Container(
                          height: height/12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: themedata.isdark ? JobColor.lightblack : JobColor.container,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/26),
                            child: Row(
                              children: [
                                Image.asset(JobPngimage.facebook,height: height/36,width: height/36),
                                SizedBox(width: width/26),
                                Text("Facebook".tr,style: urbanistBold.copyWith(fontSize: 18,)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height/46),
                        Container(
                          height: height/12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: themedata.isdark ? JobColor.lightblack : JobColor.container,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/26),
                            child: Row(
                              children: [
                                Image.asset(JobPngimage.twitter,height: height/36,width: height/36),
                                SizedBox(width: width/26),
                                Text("Twitter".tr,style: urbanistBold.copyWith(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height/46),
                        Container(
                          height: height/12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: themedata.isdark ? JobColor.lightblack : JobColor.container,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/26),
                            child: Row(
                              children: [
                                Image.asset(JobPngimage.instagram,height: height/36,width: height/36),
                                SizedBox(width: width/26),
                                Text("Instagram".tr,style: urbanistBold.copyWith(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
              ),
            ]),
      ),
    );
  }
}
