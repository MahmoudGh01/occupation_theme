import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import 'package:job_seeker/job/job_gloabelclass/job_icons.dart';
import 'package:job_seeker/job/job_pages/job_home/job_dashboard.dart';
import 'package:provider/provider.dart';
import '../../../providers/userprovider.dart';
import '../../../services/Auth.dart';
import '../../../utils/utils.dart';
import '../../job_gloabelclass/job_fontstyle.dart';
import '../job_theme/job_themecontroller.dart';

class JobCreatenewPassword extends StatefulWidget {
  const JobCreatenewPassword({Key? key}) : super(key: key);

  @override
  State<JobCreatenewPassword> createState() => _JobCreatenewPasswordState();
}

class _JobCreatenewPasswordState extends State<JobCreatenewPassword> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  final AuthService authService = AuthService();

  void changePassword(BuildContext context) {
    final newPassword = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (newPassword != confirmPassword) {
      showSnackBar(context, 'Passwords do not match');
      return;
    }

    // Get the email from the UserProvider
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    final email = userProvider.user.email;

    if (email.isEmpty) {
      showSnackBar(context, 'Email address not found');
      return;
    }

    authService.changePassword(
      context: context,
      email: email,
      newPassword: newPassword,
    );
    success();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JobDashboard("0"),
      ),
    );
  }
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());

  bool _obscureText2 = true;
  void _togglePasswordStatus2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }
  bool _obscureText1 = true;
  void _togglePasswordStatus1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }
  bool isChecked = true;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return JobColor.appcolor;
    }
    return JobColor.appcolor;
  }


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Create_New_Password".tr,style: urbanistBold.copyWith(fontSize: 22 )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(JobPngimage.createpassword,height: height/3.8,),
            SizedBox(height: height/26,),
            Text("Create_Your_New_Password".tr,style: urbanistMedium.copyWith(fontSize: 18,)),
            SizedBox(height: height/36,),
            TextFormField(
              controller: passwordController,
              obscureText: _obscureText2,
              style: urbanistSemiBold.copyWith(fontSize: 16,),
              decoration: InputDecoration(
                hintStyle: urbanistRegular.copyWith(fontSize: 16,),
                hintText: "New_Password".tr,
               fillColor: themedata.isdark?JobColor.lightblack:JobColor.appgray,
                filled: true,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText2 ? Icons.visibility_off : Icons.visibility,size: height/46,
                  ),
                  onPressed: _togglePasswordStatus2,
                ),

                prefixIcon:Icon(Icons.lock,size: height/46,),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: JobColor.appcolor)
                ),
              ),
            ),
            SizedBox(height: height/46,),
            TextFormField(
              controller: confirmPasswordController,
              obscureText: _obscureText1,
              style: urbanistSemiBold.copyWith(fontSize: 16),
              decoration: InputDecoration(
                hintStyle: urbanistRegular.copyWith(fontSize: 16,),
                hintText: "Confirm_New_Password".tr,
               fillColor: themedata.isdark?JobColor.lightblack:JobColor.appgray,
                filled: true,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText1 ? Icons.visibility_off : Icons.visibility,size: height/46,
                  ),
                  onPressed: _togglePasswordStatus1,
                ),

                prefixIcon:Icon(Icons.lock,size: height/46,),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: JobColor.appcolor)
                ),
              ),
            ),
            SizedBox(height: height/46,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  checkColor: JobColor.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  side: const BorderSide(
                    color: JobColor.appcolor,
                    width: 2.5,
                  ),
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(
                          () {
                        isChecked = value!;
                      },
                    );
                  },
                ),
                Text(
                  "Remember_me".tr,
                  style: urbanistMedium.copyWith(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: height/36,),
            const Spacer(),
            InkWell(
              splashColor:JobColor.transparent,
              highlightColor:JobColor.transparent,
              onTap: () {
                changePassword(context);


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
          ],
        ),
      ),
    );
  }

  success(){
    showDialog(
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/56),
              child: Column(
                children: [
                  Image.asset(JobPngimage.successlogo,height: height/6,fit: BoxFit.fitHeight,),
                  SizedBox(height: height/30,),
                  Text("Congratulations".tr,style: urbanistBold.copyWith(fontSize: 24,color: JobColor.appcolor )),
                  SizedBox(height: height/46,),
                  Text("Your account is ready to use. You will be redirected to the Home page in a few seconds..".tr,textAlign: TextAlign.center,style: urbanistRegular.copyWith(fontSize: 16)),
                  SizedBox(height: height/26,),
                  Image.asset(JobPngimage.processer,height: height/15,fit: BoxFit.fitHeight,),
                ],
              ),
            ),

          ],
        ),
        context: context);
  }
}
