import 'package:flutter/material.dart';
import 'package:len_den/utils/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: 'Inter',
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        color: AppColors.darkGreen,
      ),
      // elevation: 1,
      backgroundColor: AppColors.white,
      centerTitle: false,
    ),
  );
}
