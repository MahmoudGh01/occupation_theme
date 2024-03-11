import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import 'package:job_seeker/job/job_pages/job_message/job_chatting.dart';
import '../../job_gloabelclass/job_fontstyle.dart';
import '../../job_gloabelclass/job_icons.dart';
import '../job_theme/job_themecontroller.dart';

class JobMessage extends StatefulWidget {
  const JobMessage({Key? key}) : super(key: key);

  @override
  State<JobMessage> createState() => _JobMessageState();
}

class _JobMessageState extends State<JobMessage> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());
  List chats = ["Google LLC","Dribbble Inc.","Pinterest","Strip Company","Spotify Inc.","Reddit Company","AirBNB Inc.","Kayak Official"];
  List subtitle = ["Our reviewer, William An...","Okay...Do we have a deal?","Nice working with you 😁","Will the contract be sent?","This is really epic 🔥🔥","just ideas for next time","Haha that's awesome! 😂","I'll be there in 2 mins ⏱"];
  List time = ["16.00","14.45","10.38","12/22/2022","Yesterday","12/21/2022","12/21/2022","12/20/2022"];
  List chatimg = [
    JobPngimage.google,
    JobPngimage.a2,
    JobPngimage.printrest,
    JobPngimage.stripe,
    JobPngimage.spotify,
    JobPngimage.reddit,
    JobPngimage.avatar,
    JobPngimage.ellipse,
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(JobPngimage.logo,height: height/36,),
          ),
          title: Text("Message".tr,style: urbanistBold.copyWith(fontSize: 22 )),
          actions: [
            Row(
              children: [
                Image.asset(JobPngimage.search,height: height/36,color: themedata.isdark?JobColor.white:JobColor.black,),
                SizedBox(width: width/36,),
                Image.asset(JobPngimage.more,height: height/30,color: themedata.isdark?JobColor.white:JobColor.black,),
                const SizedBox(width: 15,)
              ],
            ),
          ],
          bottom: TabBar(
            indicatorColor: JobColor.appcolor,
            dividerColor: JobColor.bggray,
            labelColor: JobColor.appcolor,
            labelPadding: EdgeInsets.only(bottom: height/96),
            indicatorPadding: EdgeInsets.symmetric(horizontal: width/26),
            unselectedLabelColor: JobColor.textgray,
            unselectedLabelStyle:urbanistSemiBold.copyWith(fontSize: 18 ) ,
            labelStyle: urbanistSemiBold.copyWith(fontSize: 18 ) ,
            tabs: [
              Text("Chats".tr,),
              Text("Calls".tr,),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: JobColor.transparent,
                          highlightColor: JobColor.transparent,
                          onTap: () {
                           /* if(index == 0 || index == 2){

                            }else{
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return const ZomoChatting(type: "2");
                              },));
                            }*/
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const JobChatting();
                            },));
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: JobColor.transparent,
                                backgroundImage: AssetImage(chatimg[index].toString()),
                              ),
                              SizedBox(width: width/26),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(chats[index].toString(),style: urbanistBold.copyWith(fontSize: 18)),
                                  SizedBox(height: height/96),
                                  Text(subtitle[index].toString(),style: urbanistMedium.copyWith(fontSize: 14,color: JobColor.textgray)),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  if(index == 0 || index == 3 || index == 4)...[
                                    CircleAvatar(
                                      radius: 10,
                                      backgroundColor: JobColor.appcolor,
                                      child: Text("3",style: urbanistRegular.copyWith(fontSize: 10,color: JobColor.white)),
                                    ),
                                  ],
                                  SizedBox(height: height/96),
                                  Text(time[index].toString(),style: urbanistMedium.copyWith(fontSize: 14,color: JobColor.textgray)),
                                ],
                              ),
                            ],
                          ),
                        );
                      }, separatorBuilder: (context, index) {
                    return SizedBox(height: height/36);
                  }, itemCount: chatimg.length)
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: JobColor.transparent,
                          highlightColor: JobColor.transparent,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const JobChatting();
                            },));
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: JobColor.transparent,
                                backgroundImage: AssetImage(chatimg[index].toString()),
                              ),
                              SizedBox(width: width/26),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(chats[index].toString(),style: urbanistBold.copyWith(fontSize: 18)),
                                  SizedBox(height: height/96),
                                  Text(subtitle[index].toString(),style: urbanistMedium.copyWith(fontSize: 14,color: JobColor.textgray)),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  if(index == 0 || index == 3 || index == 4)...[
                                    CircleAvatar(
                                      radius: 10,
                                      backgroundColor: JobColor.appcolor,
                                      child: Text("3",style: urbanistRegular.copyWith(fontSize: 10,color: JobColor.white)),
                                    ),
                                  ],
                                  SizedBox(height: height/96),
                                  Text(time[index].toString(),style: urbanistMedium.copyWith(fontSize: 14,color: JobColor.textgray)),
                                ],
                              ),
                            ],
                          ),
                        );
                      }, separatorBuilder: (context, index) {
                    return SizedBox(height: height/36);
                  }, itemCount: chatimg.length)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
