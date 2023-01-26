import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechBazzar/atoms/save_shared_pref.dart';
import 'package:mechBazzar/modules/profile/models/users_model.dart';
import 'package:mechBazzar/network/api_base_helper.dart';
import 'package:mechBazzar/routes/custom_navigator.dart';
import '../../../core/constants/url_constants.dart';
import '../../../core/helper_ui.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController with HelperUI {
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

  Future<void> onSubmit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    Map<String, dynamic> _body = {
      "email": emailController.text,
      "password": passwordController.text
    };
    showLoadingDialog();
    try {
      final response = await BaseApiCallHelper.post(AppUrls.login, _body);
      print(response);
      UserModel userModel = UserModel.fromJson(response["data"][0]);
      //saveToPreference
      await SavePreferences.saveStringPreferences(
          "user", json.encode(userModel));
          print(userModel.toJson());
      hideLoadingDialog();
      CustomNavigator.pop();
    } catch (e) {
      hideLoadingDialog();
      HelperUI().showSnackbar(e.toString());
    }
  }
}
