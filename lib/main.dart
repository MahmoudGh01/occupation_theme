import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:job_seeker/job/job_pages/job_authentication/job_login.dart';
import 'package:job_seeker/job/job_pages/job_authentication/job_loginoption.dart';
import 'package:job_seeker/job/job_pages/job_authentication/job_splash.dart';
import 'package:job_seeker/providers/userprovider.dart';
import 'package:job_seeker/screens/quiz.dart';
import 'package:job_seeker/screens/screenQuizs.dart';
import 'package:job_seeker/services/Auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'job/job_pages/job_home/job_dashboard.dart';
import 'job/job_pages/job_theme/job_theme.dart';
import 'job/job_pages/job_theme/job_themecontroller.dart';
import 'job/job_pages/job_translation/stringtranslation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Get.put(AuthService());
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final AuthService authService = Get.find();
    final JobThemecontroler themedata = Get.put(JobThemecontroler());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themedata.isdark ? JobMythemes.darkTheme : JobMythemes.lightTheme,
      fallbackLocale: const Locale('en', 'US'),
      translations: JobApptranslation(),
      locale: const Locale('en', 'US'),
      home: JobSplash(),
      getPages: [
        GetPage(name: '/quiz', page: () => QuizApp()),
        GetPage(name: '/allquizbycandidat', page:()=> ScreenQuiz()),
      ],
    );
  }
}
