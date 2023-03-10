import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechBazzar/core/constants/url_constants.dart';
import 'package:mechBazzar/network/api_base_helper.dart';
import 'package:mechBazzar/routes/app_pages.dart';
import 'package:mechBazzar/routes/custom_navigator.dart';

import '../../../core/constants/string_constants.dart';
import '../../../core/helper_ui.dart';

class ForgetPasswordController extends GetxController with HelperUI {
  ForgetPasswordController();
  late TextEditingController emailController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Future<void> onInit() async {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
  }

  Future<void> onSubmit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    Map<String, dynamic> _body = {
      "email": emailController.text,
    };
    showLoadingDialog();
    try {
      final response = await BaseApiCallHelper.post(AppUrls.forgetPass, _body);
      hideLoadingDialog();
      showSnackbar(forgetPasswordLinkSend);
      CustomNavigator.pop();
    } catch (e) {
      hideLoadingDialog();
      showSnackbar(e.toString());
    }
  }
}
