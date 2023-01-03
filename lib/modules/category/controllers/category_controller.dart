import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/helper_ui.dart';
import 'dart:async';

class CategoryController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  List<String> category = ["a", "b", "c"];
  @override
  Future<void> onInit() async {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
