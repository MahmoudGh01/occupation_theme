import 'package:flutter/material.dart';

import '../../job_gloabelclass/job_color.dart';
import '../../job_gloabelclass/job_fontstyle.dart';

class JobMythemes {
  static final lightTheme = ThemeData(

    primaryColor: JobColor.appcolor,
    primarySwatch: Colors.grey,
    textTheme: const TextTheme(),
    fontFamily: 'urbanistMedium',
    scaffoldBackgroundColor: JobColor.white,

    appBarTheme: AppBarTheme(
      iconTheme:  const IconThemeData(color: JobColor.black),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: urbanistMedium.copyWith(
        color: JobColor.black,
        fontSize: 16,
      ),
      color: JobColor.transparent,
    ),
  );

  static final darkTheme = ThemeData(

    fontFamily: 'urbanistMedium',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: JobColor.white),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: urbanistMedium.copyWith(
        color: JobColor.white,
        fontSize: 15,
      ),
      color: JobColor.transparent,
    ),
  );
}