import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppThemes {
  static final ligtTheme = ThemeData(
     textSelectionTheme: TextSelectionThemeData(cursorColor: AppColors.COLOR_GREY_800),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.COLOR_GREEN,
          foregroundColor: AppColors.COLOR_WHITE),
      scaffoldBackgroundColor: AppColors.COLOR_GREY_100,
      colorScheme:
          const ColorScheme.light().copyWith(primary: AppColors.COLOR_GREEN),
      fontFamily: 'OpenSansRegular',
      backgroundColor: AppColors.COLOR_WHITE_TRANSPARENT,
      primaryColor: AppColors.COLOR_GREEN,
      primarySwatch: const MaterialColor(
        0xff3AB4DD,
        <int, Color>{
          50: Color(0xffE9F6FB),
          100: Color(0xffE9F6FB),
          200: Color(0xff91D4ED),
          300: Color(0xff67C4E5),
          400: Color(0xff3AB4DD),
          500: Color(0xff24ACDA),
          600: Color(0xff0A92C0),
          700: Color(0xff007CAA),
          800: Color(0xff006593),
          900: Color(0xff00406E)
        },
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 25, color: Colors.grey, fontWeight: FontWeight.bold),
        headline2: TextStyle(
            fontSize: 25, color: Colors.grey, fontWeight: FontWeight.bold),
        headline3: TextStyle(
            fontSize: 25, color: Colors.grey, fontWeight: FontWeight.bold),
        headline4: TextStyle(
            fontSize: 25, color: Colors.grey, fontWeight: FontWeight.bold),
        headline5: TextStyle(
            fontSize: 25, color: Colors.grey, fontWeight: FontWeight.bold),
        headline6: TextStyle(
            fontSize: 25, color: Colors.grey, fontWeight: FontWeight.bold),
        button: TextStyle(
            fontSize: 16,
            color: AppColors.COLOR_WHITE,
            fontWeight: FontWeight.w600,
            fontStyle:
                FontStyle.normal), // Taken values as per Livspace project need
      ),
      dividerColor: AppColors.COLOR_GREY_600);
}
