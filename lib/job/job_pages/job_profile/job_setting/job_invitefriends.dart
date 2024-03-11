import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import '../../../job_gloabelclass/job_fontstyle.dart';
import '../../../job_gloabelclass/job_icons.dart';
import '../../job_theme/job_themecontroller.dart';

class JobInvitefriends extends StatefulWidget {
  const JobInvitefriends({Key? key}) : super(key: key);

  @override
  State<JobInvitefriends> createState() => _JobInvitefriendsState();
}

class _JobInvitefriendsState extends State<JobInvitefriends> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());
  List isselected = [];

  List chatimg = [
    JobPngimage.profile1,
    JobPngimage.profile2,
    JobPngimage.profile3,
    JobPngimage.profile4,
    JobPngimage.profile5,
    JobPngimage.profile6,
    JobPngimage.profile7,
    JobPngimage.profile8,
    JobPngimage.profile1,
    JobPngimage.profile2,
    JobPngimage.profile3,
  ];

  List chats = ["Lauralee Quintero","Annabel Rohan","Alfonzo Schuessler","Augustina Midgett","Freida Varnes","Francene Vandyne","Geoffrey Mott","Rayford Chenail","Florencio Dorrance","Lauralee Quintero","Annabel Rohan","Alfonzo Schuessler"];

  List subtitle = ["+1-300-555-0135","+1-202-555-0136","+1-300-555-0119","+1-300-555-0161","+1-300-555-0136","+1-202-555-0167","+1-202-555-0119","+1-202-555-0171","+1-300-555-0135","+1-202-555-0136","+1-300-555-0119"];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Invite_Friends".tr,style: urbanistBold.copyWith(fontSize: 22 )),
      ),
      body: SingleChildScrollView(
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
                     setState(() {
                       if(isselected.contains(index)){
                         isselected.remove(index);
                       }else{
                         isselected.add(index);
                       }
                     });
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
                        SizedBox(height: height/96),
                        Container(
                          decoration: BoxDecoration(
                            color: isselected.contains(index) ?JobColor.transparent :JobColor.appcolor,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: isselected.contains(index) ?JobColor.appcolor :JobColor.transparent)
                          ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/96),
                              child: Text(isselected.contains(index) ?"Invited":"Invite",style: urbanistSemiBold.copyWith(fontSize: 14,color: isselected.contains(index) ?JobColor.appcolor :JobColor.white)),
                            )),
                      ],
                    ),
                  );
                }, separatorBuilder: (context, index) {
              return SizedBox(height: height/36);
            }, itemCount: chatimg.length)
        ),
      ),
    );
  }
}
