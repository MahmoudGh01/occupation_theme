import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import 'package:provider/provider.dart';
import '../../../providers/userprovider.dart';
import '../../../utils/constants.dart';
import '../../job_gloabelclass/job_fontstyle.dart';
import '../job_theme/job_themecontroller.dart';

class JobSkills extends StatefulWidget {
  const JobSkills({Key? key}) : super(key: key);

  @override
  State<JobSkills> createState() => _JobSkillsState();
}

class _JobSkillsState extends State<JobSkills> {
  final TextEditingController _skillController = TextEditingController();

  List<String> skills = [];
  void addRequirement(user) {
    if (_skillController.text.isNotEmpty) {
      Provider.of<UserProvider>(context, listen: false).addSkill(_skillController.text);


        _skillController.clear();

    }
  }

  void addSkillToBackend(userId) async {
    var url = Uri.parse('${Constants.uri}/edit-user/$userId');
    var response = await http.put(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"skills": skills}));

    if (response.statusCode == 200) {
      print('Skill added successfully');
      // chatgpt::: Update skill list ui
    } else {
      print('Failed to add skill');
    }
  }

  void removeRequirement(int index) {
    Provider.of<UserProvider>(context, listen: false).removeSkill(skills[index]);


  }

  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    skills = user.skills;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Skills".tr, style: urbanistBold.copyWith(fontSize: 22)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Skills".tr, style: urbanistMedium.copyWith(fontSize: 16)),
              SizedBox(
                height: height / 66,
              ),
              TextField(
                controller: _skillController,
                style: urbanistSemiBold.copyWith(fontSize: 16),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      user.skills = skills;
                      addRequirement(user);
                    },
                  ),
                  hintStyle: urbanistRegular.copyWith(
                    fontSize: 16,
                    color: JobColor.textgray,
                  ),
                  hintText: "Type here".tr,
                  fillColor:
                      themedata.isdark ? JobColor.lightblack : JobColor.appgray,
                  filled: true,
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
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: skills.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 5,
                    childAspectRatio: (height / 1.4) / (width / 2.5)),
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
                        padding: EdgeInsets.symmetric(horizontal: width / 36),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: width / 3.5,
                              child: Center(
                                child: Text(skills[index],
                                    style: urbanistSemiBold.copyWith(
                                        fontSize: 15, color: JobColor.appcolor),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            SizedBox(
                              width: width / 36,
                            ),
                            GestureDetector(
                              child:
                                  Icon(Icons.close, color: JobColor.appcolor),
                              onTap: () => removeRequirement(index),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
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
          onTap: () {
            addSkillToBackend(user.id);
          },
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
