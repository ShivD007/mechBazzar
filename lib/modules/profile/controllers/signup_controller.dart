import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helper_ui.dart';

class SignupController extends GetxController with HelperUI {
  SignupController();
  late TextEditingController emailController;
  late TextEditingController password;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  
  @override
  Future<void> onInit() async {
    emailController=TextEditingController();
    password=TextEditingController();
    nameController=TextEditingController();
    phoneController=TextEditingController();



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

  }

  void onSubmit(){
    if(!formKey.currentState!.validate()){
      return;
    }
  }
}
