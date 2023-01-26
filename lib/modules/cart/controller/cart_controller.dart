// ignore_for_file: unnecessary_statements

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mechBazzar/atoms/save_shared_pref.dart';
import 'package:mechBazzar/modules/profile/models/users_model.dart';
import '../../../core/constants/url_constants.dart';
import '../../../core/helper_ui.dart';
import '../../../core/models/product_res_model.dart';
import '../../../network/api_base_helper.dart';
import '../model/cart_model.dart';

class CartController extends GetxController with HelperUI {
  RxBool isListLoading = false.obs;
  UserModel? user;
  RxList<Product?> cartList = RxList<Product?>([]);
  List<Cart> orderList = [];
  RxNum total = RxNum(0);
  RxBool notValidQuantity = RxBool(false);
  int totalQty = 0;
  @override
  void onInit() {
    isListLoading.value = true;
    super.onInit();
    setUser();
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

  Future<void> getCart({
    required VoidCallback onSuccess,
    bool isLoading = false,
  }) async {
    total.value = 0;
    totalQty = 0;
    orderList.clear();
    Map<String, dynamic> _body = {"user_id": user!.id};
    if (isLoading) isListLoading.value = true;
    print("object");
    try {
      final response = await BaseApiCallHelper.post(AppUrls.getcart, _body);
      cartList.clear();
      cartList.addAll(
          response["data"] == null ? [] : List<Product>.from(response["data"]!.map((x) => Product.fromJson(x))));
      if (isLoading) isListLoading.value = false;
      onSuccess();
      findTotal();
      getOderList();
    } catch (e) {
      if (isLoading) isListLoading.value = false;
      HelperUI().showSnackbar(e.toString());
    }
  }

  Future<void> removeCart(VoidCallback onSuccess, int productId) async {
    Map<String, dynamic> _body = {"user_id": user!.id, "product_id": productId};
    showLoadingDialog();
    try {
      final response = await BaseApiCallHelper.post(AppUrls.removeCart, _body);
      onSuccess();
    } catch (e) {
      hideLoadingDialog();
      HelperUI().showSnackbar(e.toString());
    }
  }

  Future<void> addCart(VoidCallback onSuccess, {required int qty, required int productId, required int? stock}) async {
    Map<String, dynamic> _body = {"user_id": user!.id, "product_id": productId, "qty": qty};
    if (stock != null && qty > stock) {
      HelperUI().showSnackbar(stock == 0 ? "out of stock" : "Only $stock in stock", true);
      return;
    }

    showLoadingDialog();
    try {
      final response = await BaseApiCallHelper.post(AppUrls.addcart, _body);
      onSuccess();
    } catch (e) {
      hideLoadingDialog();
      HelperUI().showSnackbar(e.toString());
    }
  }

  void getOderList() {
    orderList.clear();
    cartList.forEach((element) {
      orderList.add(Cart.fromJson(element!.toJson()));
    });
  }

  void findTotal() {
    total.value = 0;
    totalQty = 0;
    cartList.forEach((element) {
      total.value += element!.price * element.qty!;
      notValidQuantity.value = (element.stock == null ? false : (element.qty! > element.stock!)) || element.stock == 0;
      totalQty += element.qty!;
    });
  }
}
