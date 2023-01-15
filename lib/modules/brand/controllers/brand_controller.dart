import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/helper_ui.dart';
import '../../../core/models/category_res_model.dart';
import '../../../core/models/product_res_model.dart';
import '../../category/repository/category_repo.dart';
import '../repository/brand_repo.dart';

class BrandController extends GetxController with HelperUI, GetSingleTickerProviderStateMixin {
  TabController? tabController;
  RxBool isInitialLoading = false.obs;
  RxBool isListLoading = false.obs;
  RxList<CategoryModel> brands = RxList([]);
  ScrollController scrollController = ScrollController();
  int pagination = 1;

  RxList<Product> selectedList = RxList<Product>([]);
  @override
  Future<void> onInit() async {
    isInitialLoading.value = true;

    isListLoading.value = true;
    await getBrands();
    scrollController.addListener(() async {
      if (scrollController.offset >= scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        await getProductList(brands[tabController!.index].id, pagination);
      }
    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getBrands() async {
    await BrandRepo.getBrands(onError: (e) {
      isInitialLoading.value = false;
      isListLoading.value = false;
      HelperUI().showSnackbar(e.toString());
    }, onSuccess: (response) async {
      CategoryModels.fromJson(response).data.forEach((item) {
        brands.add(item);
      });

      tabController = TabController(length: brands.length, vsync: this);
      tabController!.addListener(() async {
        selectedList.clear();
        isListLoading.value = true;
        await getProductList(brands[tabController!.index].id, 1);
      });
      await getProductList(brands.first.id, 1);
      isInitialLoading.value = false;
    });
  }

  Future<void> getProductList(int id, int page) async {
    await BrandRepo.getProductList(
        brandId: id,
        page: page,
        onError: (e) {
          isListLoading.value = false;
          HelperUI().showSnackbar(e.toString());
        },
        onSuccess: (response) {
          pagination++;
          selectedList.addAll(
              response["data"] == null ? [] : List<Product>.from(response["data"]!.map((x) => Product.fromJson(x))));

          isListLoading.value = false;
        });
  }
}
