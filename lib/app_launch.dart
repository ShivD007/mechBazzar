import 'dart:ui';
import 'package:mechBazzar/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/app_themes.dart';

class AppLaunch extends StatelessWidget {
  const AppLaunch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ScreenUtilInit(
          designSize: const Size(414, 896),
          builder: (_,child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "",
            translationsKeys: {},
            locale: Get.deviceLocale,
            fallbackLocale: const Locale('en', 'US'),
            enableLog: true,
            themeMode: ThemeMode.system,
            theme: AppThemes.ligtTheme,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            builder: (context, child) {
              return GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                child: child,
              );
            },
          ),
        );
      },
    );
  }
}
