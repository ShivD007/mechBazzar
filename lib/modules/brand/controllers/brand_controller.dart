import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/helper_ui.dart';
import '../../../core/models/product_res_model.dart';

class BrandController extends GetxController with HelperUI, GetSingleTickerProviderStateMixin {
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
  RxList<Product?> selectedList = RxList<Product?>([]);
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
