import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechBazzar/core/models/category_res_model.dart';
import 'package:mechBazzar/core/models/product_res_model.dart';
import 'package:mechBazzar/modules/category/repository/category_repo.dart';
import 'dart:async';

class CategoryController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxBool isInitialLoading = false.obs;
  RxBool isSubCategoryLoading = false.obs;
  RxBool isListLoading = false.obs;
  RxList<String> category = RxList([]);

  List temp1 = [1, 2, 3, 4];
  List temp2 = [5, 4];

  RxList<String> subCategory = RxList([]);
  RxString slectedSubCategory = RxString("");
  RxList<Product?> selectedList = RxList<Product?>([]);
  @override
  Future<void> onInit() async {
    isInitialLoading.value = true;
    isSubCategoryLoading.value = true;
    isListLoading.value = true;
    getCategory();

    super.onInit();
  }

  void getCategory() {
    CategoryRepo.getShopCategory(
        onError: (onError) {},
        onSuccess: (response) {
          CategoryModels.fromJson(response).data?.forEach((item) {
            category.add(item!.name!);
          });

          getSubCategory(1);

          tabController = TabController(length: category.length, vsync: this);
          tabController.addListener(() {
            isSubCategoryLoading.value = true;
            getSubCategory(tabController.index + 1);
          });
          isInitialLoading.value = false;
        });
  }

  void getSubCategory(int id) {
    CategoryRepo.getShopSubCategory(
        categoryId: id,
        onError: (onError) {},
        onSuccess: (response) {
          subCategory.clear();
          CategoryModels.fromJson(response).data?.forEach((item) {
            subCategory.add(item!.name!);
          });
          slectedSubCategory.value = subCategory.first;
          isSubCategoryLoading.value = false;
          getProductList((tabController.index + 1), (subCategory.indexOf(subCategory.first) + 1), 1, 1);
        });
  }

  void getProductList(int id, int subId, int page, int sortBy) {
    CategoryRepo.getProductList(
        categoryId: id,
        subcategoryId: subId,
        page: page,
        sortBy: sortBy,
        onError: (onError) {},
        onSuccess: (response) {
          selectedList.addAll(ProductList.fromJson(response).data ?? []);

          isListLoading.value = false;
        });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
