import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mechBazzar/atoms/save_shared_pref.dart';
import 'package:mechBazzar/modules/profile/models/users_model.dart';
import '../../../core/constants/url_constants.dart';
import '../../../core/helper_ui.dart';
import '../../../core/models/product_res_model.dart';
import '../../../network/api_base_helper.dart';

class PlaceOrderController extends GetxController with HelperUI {
  late UserModel user;
  late TextEditingController cityController;
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController countryController;
  late TextEditingController zipcodeController;
  late TextEditingController noteController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    user = UserModel.fromJson(
        json.decode(SavePreferences.getStringPreferences("user")!));

    cityController = TextEditingController();
    nameController = TextEditingController(text:user.name);
    emailController = TextEditingController(text: user.email);
    phoneController = TextEditingController(text:user.phone);
    addressController = TextEditingController(text:user.address);
    countryController = TextEditingController(text: "India");
    zipcodeController = TextEditingController();
    noteController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    cityController.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    countryController.dispose();
    zipcodeController.dispose();
    noteController.dispose();
  }

  Future<void> onSubmit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
  }
}
