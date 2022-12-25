import 'dart:math';
import 'package:admin_jandhara/modules/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/di/injection_container.dart';
import '../../../core/helper_ui.dart';
import '../../../core/models/category_post_res_model.dart';
import '../../../networking/remote_api_repository.dart';
import '../../category_post_controller.dart';

class HomeController extends GetxController with HelperUI {
  HomeController();

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
