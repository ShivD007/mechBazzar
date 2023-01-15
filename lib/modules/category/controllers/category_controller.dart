import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechBazzar/core/models/category_res_model.dart';
import 'package:mechBazzar/core/models/product_res_model.dart';
import 'package:mechBazzar/modules/category/repository/category_repo.dart';
import 'dart:async';

class CategoryController extends GetxController with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  RxBool isInitialLoading = false.obs;
  RxBool isSubCategoryLoading = false.obs;
  RxBool isListLoading = false.obs;
  RxList<CategoryModel> category = RxList([]);

  List temp1 = [1, 2, 3, 4];
  List temp2 = [5, 4];

  RxList<CategoryModel> subCategory = RxList([]);
  RxString slectedSubCategory = RxString("");
  RxList<Product> selectedList = RxList<Product>([]);
  @override
  Future<void> onInit() async {
    isInitialLoading.value = true;
    isSubCategoryLoading.value = true;
    isListLoading.value = true;
    await getCategory();

    super.onInit();
  }

  Future<void> getCategory() async {
    await CategoryRepo.getShopCategory(
        onError: (onError) {},
        onSuccess: (response) async {
          CategoryModels.fromJson(response).data.forEach((item) {
            category.add(item);
          });

          tabController = TabController(length: category.length, vsync: this);
          tabController!.addListener(() async {
            selectedList.clear();
            isListLoading.value = true;
            isSubCategoryLoading.value = true;

            await getSubCategory(category[tabController!.index].id);
          });
          await getSubCategory(category.first.id);
          isInitialLoading.value = false;
        });
  }

  Future<void> getSubCategory(int id) async {
    await CategoryRepo.getShopSubCategory(
        categoryId: id,
        onError: (onError) {},
        onSuccess: (response) async {
          subCategory.clear();
          CategoryModels.fromJson(response).data.forEach((item) {
            subCategory.add(item);
          });
          slectedSubCategory.value = subCategory.first.name;
          isSubCategoryLoading.value = false;
          await getProductList(category[tabController!.index].id, (subCategory.first.id), 1, 1);
        });
  }

  Future<void> getProductList(int id, int subId, int page, int sortBy) async {
    await CategoryRepo.getProductList(
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
