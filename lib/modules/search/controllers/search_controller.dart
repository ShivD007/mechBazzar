import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechbazaar/core/debouncer.dart';
import '../../../core/helper_ui.dart';
import '../../../core/models/product_res_model.dart';
import '../repository/search_repo.dart';

class SearchController extends GetxController with HelperUI {
  RxBool isListLoading = false.obs;
  RxBool searchingEmpty = true.obs;

  RxList<Product> searchList = RxList<Product>([]);
  Debouncer debouncer = Debouncer(milliseconds: 500);
  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  int pagination = 1;

  @override
  Future<void> onInit() async {
    super.onInit();
    scrollController.addListener(() async {
      if (scrollController.offset >= scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        await getProductList(textEditingController.text, pagination);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getProductList(String text, int page) async {
    await SearchRepo.getProductList(
        search: text,
        page: page,
        onError: (e) {
          isListLoading.value = false;
          HelperUI().showSnackbar(e.toString());
        },
        onSuccess: (response) {
          if ((response["data"] as List).isNotEmpty) {
            pagination++;
          }
          searchList.addAll(
              response["data"] == null ? [] : List<Product>.from(response["data"]!.map((x) => Product.fromJson(x))));

          isListLoading.value = false;
        });
  }
}
