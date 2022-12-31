import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helper_ui.dart';

class ProfileController extends GetxController with HelperUI {

  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  
  @override
  Future<void> onInit() async {
    emailController=TextEditingController();
    addressController=TextEditingController();
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
    addressController.dispose(); 
    nameController.dispose(); 
    phoneController.dispose(); 

  }

  void onEdit(){
    if(!formKey.currentState!.validate()){
      return;
    }
  }

  void onDeleteUser(){
  
  }
}
