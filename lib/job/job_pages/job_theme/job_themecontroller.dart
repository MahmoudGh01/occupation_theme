import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../job_gloabelclass/job_prefsname.dart';
import 'job_theme.dart';

class JobThemecontroler extends GetxController{
  @override
  void onInit()
  {
    SharedPreferences.getInstance().then((value) {
      isdark = value.getBool(jobDarkMode)!;
    });
    update();
    super.onInit();
  }

  var isdark = false;
  Future<void> changeThem (state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isdark = prefs.getBool(jobDarkMode) ?? true;
    isdark = !isdark;

    if (state == true) {
      Get.changeTheme(JobMythemes.darkTheme);
      isdark = true;
    }
    else {
      Get.changeTheme(JobMythemes.lightTheme);
      isdark = false;
    }
    update();
  }

}