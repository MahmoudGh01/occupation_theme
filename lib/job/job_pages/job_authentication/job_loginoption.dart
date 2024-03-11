import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import 'package:job_seeker/job/job_gloabelclass/job_icons.dart';
import '../../../services/Auth.dart';
import '../../job_gloabelclass/job_fontstyle.dart';
import '../job_theme/job_themecontroller.dart';
import 'job_login.dart';
import 'job_signup.dart';

class JobLoginoption extends StatefulWidget {
  const JobLoginoption({Key? key}) : super(key: key);

  @override
  State<JobLoginoption> createState() => _JobLoginoptionState();
}

class _JobLoginoptionState extends State<JobLoginoption> {
  final AuthService authService = AuthService();

  final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
      '104792978938-smu99c48hkqint3g8afkm42ffeuikqig.apps.googleusercontent.com',
      scopes: ['email']);

  Future<void> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        // Send Google Sign-In data to the backend
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
        final String? code = googleAuth.idToken;

        if (code != null) {
          await authService.sendGoogleSignInDataToBackend(code, context);
        }
      }
    } catch (error) {
      print('Error during Google Sign-In: $error');
    }
  }
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
        child: Column(
          children: [
            SizedBox(height: height/10,),
            Image.asset(JobPngimage.loginoption,height: height/4.5,fit: BoxFit.fitHeight,),
            SizedBox(height: height/26,),
            Text("Lets_you_in".tr,style: urbanistBold.copyWith(fontSize: 40)),
            SizedBox(height: height/23,),
            Container(
              height: height/15,
              width: width/1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: themedata.isdark?JobColor.borderblack:JobColor.bggray)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(JobPngimage.facebook,height: height/30,),
                  SizedBox(width: width/36,),
                  Text("Continue_with_Facebook".tr,style: urbanistSemiBold.copyWith(fontSize: 14)),
                ],
              ),
            ),
            SizedBox(height: height/46,),
            GestureDetector(
              onTap: () async {
                // Perform Google Sign-In
                try {
                  await _handleSignIn();
                } catch (error) {
                  print('Error during Google Sign-In: $error');
                }
              },
              child: Container(
                height: height/15,
                width: width/1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: themedata.isdark?JobColor.borderblack:JobColor.bggray)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(JobPngimage.google,height: height/30,),
                    SizedBox(width: width/36,),
                    Text("Continue_with_Google".tr,style: urbanistSemiBold.copyWith(fontSize: 14)),
                  ],
                ),
              ),
            ),
            SizedBox(height: height/46,),
            Container(
              height: height/15,
              width: width/1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: themedata.isdark?JobColor.borderblack:JobColor.bggray)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(JobPngimage.apple,height: height/30,color: themedata.isdark?JobColor.white:JobColor.black,),
                  SizedBox(width: width/36,),
                  Text("Continue_with_Apple".tr,style: urbanistSemiBold.copyWith(fontSize: 14)),
                ],
              ),
            ),
            SizedBox(height: height/26,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: height / 500,
                    width: width / 2.4,
                    color: themedata.isdark?JobColor.borderblack:JobColor.bggray),
                SizedBox(width: width / 56),
                Text(
                  "OR".tr,
                  style: urbanistSemiBold.copyWith(
                      fontSize: 15, color: JobColor.textgray),
                ),
                SizedBox(width: width / 56),
                Container(
                    height: height / 500,
                    width: width / 2.4,
                    color: themedata.isdark?JobColor.borderblack:JobColor.bggray),
              ],
            ),
            SizedBox(height: height/26,),
            const Spacer(),
            InkWell(
              splashColor: JobColor.transparent,
              highlightColor: JobColor.transparent,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const JobLogin();
                  },
                ));
              },
              child: Container(
                height: height/15,
                width: width/1,
                decoration: BoxDecoration(
                  color: JobColor.appcolor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(child: Text("Sign_in_with_password".tr,style: urbanistBold.copyWith(fontSize: 16,color: JobColor.white),)),
              ),
            ),
            SizedBox(height: height/36,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dont_have_an_account'.tr,
                    style: urbanistRegular.copyWith(
                        fontSize: 14, color: JobColor.textgray)),
                InkWell(
                  splashColor: JobColor.transparent,
                  highlightColor: JobColor.transparent,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const JobSignup();
                      },
                    ));
                  },
                  child: Text('Sign_up'.tr,
                      style: urbanistSemiBold.copyWith(
                          fontSize: 14, color: JobColor.appcolor)),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
