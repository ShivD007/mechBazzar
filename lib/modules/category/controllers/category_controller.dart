import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/helper_ui.dart';
import 'dart:async';

class CategoryController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  List<String> category = [
    "Electrical Tools & Equipment",
    "Office Stationery & Supplies",
    "Industrial Tools&construction"
  ];

  List temp1 = [1, 2, 3, 4];
  List temp2 = [5, 4];

  List<String> subCategory = ["Pumps", "Geysers & Heaters", "Fans", "wires & Cables"];
  RxString slectedSubCategory = RxString("");
  RxList selectedList = RxList([8, 8, 3, 4, 5, 6, 5]);
  @override
  Future<void> onInit() async {
    tabController = TabController(length: 3, vsync: this);
    slectedSubCategory.value = subCategory.first;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
