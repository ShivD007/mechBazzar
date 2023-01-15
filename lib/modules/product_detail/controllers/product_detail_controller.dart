import 'dart:developer';

import 'package:get/get.dart';
import 'package:mechBazzar/core/models/product_res_model.dart';
import '../../../core/helper_ui.dart';
import '../repository/product_repo.dart';

class ProductDetailController extends GetxController with HelperUI {
  RxBool isInitialLoading = false.obs;
  late Product product;
  late int productId;

  @override
  Future<void> onInit() async {
    isInitialLoading.value = true;
    productId = Get.arguments;
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await getProductDetails(productId);
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getProductDetails(int productId) async {
    await ProductDetailRepo.getProductDetails(
        productId: productId,
        onError: (onError) {},
        onSuccess: (response) async {
          product = Product.fromJson(response["data"][0]);
          log(response.toString());
          isInitialLoading.value = false;
        });
  }
}
