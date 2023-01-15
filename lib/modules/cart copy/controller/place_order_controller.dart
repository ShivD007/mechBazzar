import 'dart:convert';

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

  @override
  void onInit() {
    super.onInit();
    user = UserModel.fromJson(
        json.decode(SavePreferences.getStringPreferences("user")!));

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

}
