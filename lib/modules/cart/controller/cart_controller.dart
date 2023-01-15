import 'dart:convert';

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
  @override
  void onInit() {
    isListLoading.value = true;
    super.onInit();
    user = UserModel.fromJson(json.decode(SavePreferences.getStringPreferences("user")!));

    getCart();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getCart() async {
    Map<String, dynamic> _body = {"user_id": user.id};
    isListLoading.value = true;
    cartList.clear();
    try {
      final response = await BaseApiCallHelper.post(AppUrls.getcart, _body);
      cartList.addAll(ProductList.fromJson(response).data ?? []);
      isListLoading.value = false;
    } catch (e) {
      isListLoading.value = false;
      HelperUI().showSnackbar(e.toString());
    }
  }

  Future<void> removeCart() async {
    Map<String, dynamic> _body = {"user_id": user.id, "product_id": 3};
    showLoadingDialog();
    try {
      final response = await BaseApiCallHelper.post(AppUrls.removeCart, _body);
      hideLoadingDialog();
    } catch (e) {
      hideLoadingDialog();
      HelperUI().showSnackbar(e.toString());
    }
  }

  Future<void> addCart() async {
    Map<String, dynamic> _body = {"user_id": user.id, "product_id": 3, "qty": 3};
    showLoadingDialog();
    try {
      final response = await BaseApiCallHelper.post(AppUrls.addcart, _body);
      hideLoadingDialog();
    } catch (e) {
      hideLoadingDialog();
      HelperUI().showSnackbar(e.toString());
    }
  }
}
