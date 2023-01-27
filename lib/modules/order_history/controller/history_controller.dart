// ignore_for_file: unnecessary_statements

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mechBazzar/atoms/save_shared_pref.dart';
import 'package:mechBazzar/modules/order_history/order_model.dart';
import 'package:mechBazzar/modules/profile/models/users_model.dart';
import '../../../core/constants/url_constants.dart';
import '../../../core/helper_ui.dart';
import '../../../core/models/product_res_model.dart';
import '../../../network/api_base_helper.dart';

class HistoryController extends GetxController with HelperUI {
  RxBool isListLoading = false.obs;
  UserModel? user;
  RxList<OrderData?> orderList = RxList<OrderData?>([]);

  @override
  void onInit() {
    super.onInit();
    setUser();
    getOrder();

  }

  void setUser() {
    String? users = SavePreferences.getStringPreferences("user");
    user = users == null ? null : UserModel.fromJson(json.decode(users));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getOrder() async {
    Map<String, dynamic> _body = {"user_id": user!.id};
    isListLoading.value = true;
    print("object");
    try {
      final response = await BaseApiCallHelper.post(AppUrls.getOrder, _body);
      orderList.clear();
      OrderModel order=OrderModel.fromJson(response);
      orderList.addAll(order.data??[]);
       isListLoading.value = false;
    } catch (e) {
      isListLoading.value = false;
      HelperUI().showSnackbar(e.toString());
    }
  }
}
