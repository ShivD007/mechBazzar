import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechBazzar/atoms/save_shared_pref.dart';
import 'package:mechBazzar/core/constants/string_constants.dart';
import 'package:mechBazzar/core/constants/url_constants.dart';
import 'package:mechBazzar/modules/profile/models/users_model.dart';
import '../../../core/helper_ui.dart';
import '../../../network/api_base_helper.dart';

class ProfileController extends GetxController with HelperUI {
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  UserModel user = UserModel();
  @override
  Future<void> onInit() async {
    emailController = TextEditingController();
    addressController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();

    super.onInit();
    initValues();
  }

  initValues() {
    user =UserModel.fromJson( json.decode(SavePreferences.getStringPreferences("user")!));

    emailController.text = user.email ?? "";
    addressController.text = user.address ?? "";
    nameController.text = user.name ?? "";
    phoneController.text = user.phone ?? "";
    update(["updateUI"]);
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
    if (!formKey1.currentState!.validate()) {
      return;
    }
    Map<String, dynamic> _body = {
      "address": addressController.text,
      "name": nameController.text,
      "phone": phoneController.text,
      "user_id": user.id
    };
    showLoadingDialog();

    try {
      await BaseApiCallHelper.post(AppUrls.editProfile, _body);
      hideLoadingDialog();
      user.name = nameController.text;
      user.address = addressController.text;
      user.phone = phoneController.text;
      //saveToPreference
      await SavePreferences.saveStringPreferences("user", json.encode(user));
      HelperUI().showSnackbar("Successfully edited!");
    } catch (e) {
      hideLoadingDialog();
      HelperUI().showSnackbar(e.toString());
    }
  }

  Future<void> onDeleteUser() async {
    Map<String, dynamic> _body = {"user_id": user.id};
    showLoadingDialog();

    try {
      await BaseApiCallHelper.post(AppUrls.deleteProfile, _body);
      hideLoadingDialog();
      logout();
    } catch (e) {
      hideLoadingDialog();
      HelperUI().showSnackbar(e.toString());
    }
  }
}
