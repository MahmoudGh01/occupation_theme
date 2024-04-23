import 'dart:io';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import 'package:job_seeker/job/job_gloabelclass/job_icons.dart';
import 'package:provider/provider.dart';

import '../../../providers/userprovider.dart';
import '../../job_gloabelclass/job_fontstyle.dart';
import '../job_theme/job_themecontroller.dart';

class JobEditprofile extends StatefulWidget {
  const JobEditprofile({Key? key}) : super(key: key);

  @override
  State<JobEditprofile> createState() => _JobEditprofileState();
}

class _JobEditprofileState extends State<JobEditprofile> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  Future<File?> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
    return _profileImage;
  }

  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile".tr, style: urbanistBold.copyWith(fontSize: 22)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () async {
                    final pickedFile = await _pickImage();
                    setState(() {
                      if (pickedFile != null) {
                        _profileImage = File(pickedFile.path);
                        //user.profilePicturePath = _profileImage!.path;
                      }
                    });
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: _profileImage != null
                            ? FileImage(_profileImage!)
                            : user.profilePicturePath.isNotEmpty
                                ? NetworkImage(user.profilePicturePath)
                                : const AssetImage('assets/default_profile.png')
                                    as ImageProvider,
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: height / 26,
                            height: height / 26,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: JobColor.appcolor),
                            child: const Icon(
                              Icons.edit_sharp,
                              size: 22,
                              color: JobColor.white,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height / 30,
              ),
              Text("Full_name".tr,
                  style: urbanistMedium.copyWith(fontSize: 16)),
              SizedBox(
                height: height / 66,
              ),
              TextField(
                style: urbanistSemiBold.copyWith(fontSize: 16),
                decoration: InputDecoration(
                  hintStyle: urbanistRegular.copyWith(
                    fontSize: 16,
                    color: JobColor.textgray,
                  ),
                  hintText: "Full_name".tr,
                  fillColor:
                      themedata.isdark ? JobColor.lightblack : JobColor.appgray,
                  filled: true,
                  //  prefixIcon:Icon(Icons.search_rounded,size: height/36,color: JobColor.textgray,),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: JobColor.appcolor)),
                ),
              ),
              SizedBox(
                height: height / 46,
              ),
              Text("Birthdate".tr,
                  style: urbanistMedium.copyWith(fontSize: 16)),
              SizedBox(
                height: height / 66,
              ),
              TextField(
                enabled: false,
                style: urbanistSemiBold.copyWith(
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintStyle: urbanistRegular.copyWith(
                    fontSize: 16,
                    color: JobColor.textgray,
                  ),
                  hintText: "Birthdate".tr,
                  fillColor:
                      themedata.isdark ? JobColor.lightblack : JobColor.appgray,
                  filled: true,
                  suffixIcon: Icon(
                    Icons.date_range,
                    size: height / 36,
                    color: JobColor.textgray,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: JobColor.appcolor)),
                ),
              ),
              SizedBox(
                height: height / 46,
              ),
              Text("Current_Position".tr,
                  style: urbanistMedium.copyWith(fontSize: 16)),
              SizedBox(
                height: height / 66,
              ),
              TextField(
                style: urbanistSemiBold.copyWith(
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintStyle: urbanistRegular.copyWith(
                    fontSize: 16,
                    color: JobColor.textgray,
                  ),
                  hintText: "UI/UX Designer at Paypal Inc.".tr,
                  fillColor:
                      themedata.isdark ? JobColor.lightblack : JobColor.appgray,
                  filled: true,
                  suffixIcon: Icon(
                    Icons.arrow_drop_down_sharp,
                    size: height / 36,
                    color: JobColor.textgray,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: JobColor.appcolor)),
                ),
              ),
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
          onTap: () {},
          child: Container(
            height: height / 15,
            width: width / 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: JobColor.appcolor,
            ),
            child: Center(
              child: Text("Save".tr,
                  style: urbanistSemiBold.copyWith(
                      fontSize: 16, color: JobColor.white)),
            ),
          ),
        ),
      ),
    );
  }
}
