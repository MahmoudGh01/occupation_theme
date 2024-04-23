import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_gloabelclass/job_color.dart';
import '../../../services/Auth.dart';
import '../../job_gloabelclass/job_fontstyle.dart';
import '../job_theme/job_themecontroller.dart';
import 'job_createpassword.dart';

class JobOtpverification extends StatefulWidget {
  final String email;
  const JobOtpverification({ required this.email}) ;

  @override
  State<JobOtpverification> createState() => _JobOtpverificationState();
}

class _JobOtpverificationState extends State<JobOtpverification> {
  final TextEditingController codeController = TextEditingController();
  final AuthService authService = AuthService();
  String OTPcode ="" ;
  void verifyCode(BuildContext context) async {
    final code = OTPcode;
    print(OTPcode);
    final result = await authService.verifyCode(
        context: context, email: widget.email, code: code);
    if (result == 200) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const JobCreatenewPassword();
        },
      ));

    } else {
      // Handle verification failure (e.g., show an error message)
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Verification Failed"),
          content:
          Text("The verification code is incorrect. Please try again."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(JobThemecontroler());
  @override
  void initState()
  {
    super.initState();
    startTimer();
  }
  bool isresend=false;
  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 2);
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }
  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        isresend = true;
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(2));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP_Code_Verification".tr,style: urbanistBold.copyWith(fontSize: 22 )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height/10,),
            Text("Code has been send to your email".tr,style: urbanistMedium.copyWith(fontSize: 16,)),
            SizedBox(height: height/36,),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: height/11,
                    width: height/11,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length == 1){
                          OTPcode+=value;
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      onSaved: (pin1){},
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: JobColor.appcolor)
                        ),
                       fillColor: themedata.isdark?JobColor.lightblack:JobColor.appgray,
                        filled: true,
                      ),
                      style: urbanistSemiBold.copyWith(fontSize: 20),
                      cursorColor: JobColor.textgray,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height/11,
                    width: height/11,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length == 1){
                          OTPcode+=value;
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      onSaved: (pin1){},
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: JobColor.appcolor)
                        ),
                       fillColor: themedata.isdark?JobColor.lightblack:JobColor.appgray,
                        filled: true,
                      ),
                      style: urbanistSemiBold.copyWith(fontSize: 20),
                      cursorColor: JobColor.textgray,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height/11,
                    width: height/11,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length == 1){
                          OTPcode+=value;
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      onSaved: (pin1){},
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: JobColor.appcolor)
                        ),
                       fillColor: themedata.isdark?JobColor.lightblack:JobColor.appgray,
                        filled: true,
                      ),
                      style: urbanistSemiBold.copyWith(fontSize: 20),
                      cursorColor: JobColor.textgray,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height/11,
                    width: height/11,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length == 1){
                          OTPcode+=value;
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      onSaved: (pin1){},
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: JobColor.appcolor)
                        ),
                       fillColor: themedata.isdark?JobColor.lightblack:JobColor.appgray,
                        filled: true,
                      ),
                      style: urbanistSemiBold.copyWith(fontSize: 20),
                      cursorColor: JobColor.textgray,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height/36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Resend_code_in".tr,style: urbanistRegular.copyWith(fontSize: 16)),
                SizedBox(width: width/96),
                Text("${minutes.toString()}:${seconds.toString()}s".tr,style: urbanistMedium.copyWith(fontSize: 16,color: JobColor.appcolor)),
              ],
            ),
            const Spacer(),
            InkWell(
              splashColor: JobColor.transparent,
              highlightColor: JobColor.transparent,
              onTap: () {
                verifyCode(context);

              },
              child: Container(
                height: height/15,
                width: width/1,
                decoration: BoxDecoration(
                  color: JobColor.appcolor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(child: Text("Verify".tr,style: urbanistBold.copyWith(fontSize: 16,color: JobColor.white),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
