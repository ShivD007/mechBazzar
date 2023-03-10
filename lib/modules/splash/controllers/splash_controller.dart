import 'dart:convert';
import 'dart:io';
import 'package:mechBazzar/atoms/save_shared_pref.dart';
import 'package:mechBazzar/core/shared_preference_util_impl.dart';
import 'package:mechBazzar/modules/profile/models/users_model.dart';
import 'package:mechBazzar/routes/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  SplashController();

  @override
  void onInit() {
    super.onInit();
    routing();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  Future<void> routing() async {
    int nSplashTimer = 2;

    await Future.delayed(Duration(seconds: nSplashTimer)).then((value) async {
      CustomNavigator.pushReplacement(Routes.home);
    });
  }
}
