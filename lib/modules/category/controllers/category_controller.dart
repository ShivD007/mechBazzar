import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/helper_ui.dart';
import 'dart:async';

class CategoryController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  List<String> category = ["a", "b", "c", "d", "e", "f", "g", "h"];
  @override
  Future<void> onInit() async {
    tabController = TabController(length: 8, vsync: this);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
