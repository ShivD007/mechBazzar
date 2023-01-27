import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechBazzar/core/constants/url_constants.dart';
import 'package:mechBazzar/network/api_base_helper.dart';
import 'package:mechBazzar/routes/app_pages.dart';
import 'package:mechBazzar/routes/custom_navigator.dart';
import '../../../core/helper_ui.dart';

class SignupController extends GetxController with HelperUI {
  SignupController();
  late TextEditingController emailController;
  late TextEditingController password;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  
  @override
  Future<void> onInit() async {
    emailController=TextEditingController();
    password=TextEditingController();
    nameController=TextEditingController();
    phoneController=TextEditingController();
    addressController=TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose(); 
    password.dispose(); 
    nameController.dispose(); 
    phoneController.dispose(); 
    addressController.dispose(); 

  }

   Future<void> onSubmit() async {
    if(!formKey.currentState!.validate()){
      return;
    }

    Map<String,dynamic> _body={
      "email":emailController.text,
      "password":password.text,
      "name":nameController.text,
      "phone":phoneController.text,
      "address":addressController.text
    };
showLoadingDialog();
      try {
      final response = await BaseApiCallHelper.post(AppUrls.signup, _body);
         hideLoadingDialog();

      CustomNavigator.pop();
    } catch (e) {
         hideLoadingDialog();

        HelperUI().showSnackbar(e.toString());
    }
  }
}
