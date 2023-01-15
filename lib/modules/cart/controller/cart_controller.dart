import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mechBazzar/atoms/save_shared_pref.dart';
import 'package:mechBazzar/modules/profile/models/users_model.dart';
import '../../../core/constants/url_constants.dart';
import '../../../core/helper_ui.dart';
import '../../../core/models/product_res_model.dart';
import '../../../network/api_base_helper.dart';

class CartController extends GetxController with HelperUI {
  RxBool isListLoading = false.obs;
  late UserModel user;
  RxList<Product?> cartList = RxList<Product?>([]);
  RxNum total=RxNum(0);
  @override
  void onInit() {
    isListLoading.value = true;
    super.onInit();
    user = UserModel.fromJson(json.decode(SavePreferences.getStringPreferences("user")!));

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getCart( {required VoidCallback onSuccess,bool isLoading = false,})async {
    Map<String, dynamic> _body = {"user_id": user.id};
    if (isLoading) isListLoading.value = true;

    try {
      final response = await BaseApiCallHelper.post(AppUrls.getcart, _body);
      cartList.clear();
      cartList.addAll(
          response["data"] == null ? [] : List<Product>.from(response["data"]!.map((x) => Product.fromJson(x))));
      if (isLoading) isListLoading.value = false;
      onSuccess();
      findTotal();
    } catch (e) {
      if (isLoading) isListLoading.value = false;
      HelperUI().showSnackbar(e.toString());
    }
  }

  Future<void> removeCart(VoidCallback onSuccess, int productId) async {
    Map<String, dynamic> _body = {"user_id": user.id, "product_id": productId};
    showLoadingDialog();
    try {
      final response = await BaseApiCallHelper.post(AppUrls.removeCart, _body);
        onSuccess();

    } catch (e) {
      hideLoadingDialog();
      HelperUI().showSnackbar(e.toString());
    }
  }

  Future<void> addCart(VoidCallback onSuccess, {required int qty, required int productId}) async {
    Map<String, dynamic> _body = {"user_id": user.id, "product_id": productId, "qty": qty};
    showLoadingDialog();
    try {
      final response = await BaseApiCallHelper.post(AppUrls.addcart, _body);
      onSuccess();
    } catch (e) {
      hideLoadingDialog();
      HelperUI().showSnackbar(e.toString());
    }
  }

  void findTotal(){
   total.value=0;
   cartList.forEach((element) {total.value+=element!.price*element.qty!;});
    
  }
}
