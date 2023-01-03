import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechBazzar/routes/custom_navigator.dart';

import '../../../core/helper_ui.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController with HelperUI, GetSingleTickerProviderStateMixin {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Future<void> onInit() async {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void onSubmit() {
    // if(!formKey.currentState!.validate()){
    //   return;
    // }

    CustomNavigator.pushTo(Routes.home);
  }
}
