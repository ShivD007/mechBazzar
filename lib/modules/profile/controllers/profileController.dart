import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechBazzar/core/constants/url_constants.dart';
import '../../../core/helper_ui.dart';
import '../../../network/api_base_helper.dart';

class ProfileController extends GetxController with HelperUI {
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Future<void> onInit() async {
    emailController = TextEditingController();
    addressController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();

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

  Future<void> onEdit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    Map<String, dynamic> _body = {
      "address": addressController.text,
      "name": nameController.text,
      "phone": phoneController.text,
      "user_id": 31
    };

    try {
      final response = await BaseApiCallHelper.post(AppUrls.editProfile, _body);
    } catch (e) {}
  }


  Future<void> onDeleteUser() async {
    Map<String, dynamic> _body = {"user_id": 31};

    try {
      final response =
          await BaseApiCallHelper.post(AppUrls.deleteProfile, _body);
    } catch (e) {}
  }
}
