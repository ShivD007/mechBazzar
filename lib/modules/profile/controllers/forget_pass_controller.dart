import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helper_ui.dart';

class ForgetPasswordController extends GetxController with HelperUI {
  ForgetPasswordController();
  late TextEditingController emailController;
  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  @override
  Future<void> onInit() async {
    super.onInit();
    emailController=TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
  }

  void onSubmit(){
    if(!formKey.currentState!.validate()){
      return;
    }
  }
}
