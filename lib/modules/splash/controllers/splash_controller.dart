import 'dart:convert';
import 'dart:io';
import 'package:admin_jandhara/core/shared_preference_util_impl.dart';
import 'package:admin_jandhara/routes/custom_navigator.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  SplashController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  Future<void> setSplashTimer() async {
    int nSplashTimer = 2;

    await Future.delayed(Duration(seconds: nSplashTimer)).then((value) async {
      int value = await SharedPreferenceUtils().getInt("isLoggedIn");
      print(value);
      if (value == 1) {
        CustomNavigator.pushReplacement(Routes.HOME);
      } else {
        CustomNavigator.pushReplacement(Routes.ENTER_PASSWORD);
      }
    });
  }
}
