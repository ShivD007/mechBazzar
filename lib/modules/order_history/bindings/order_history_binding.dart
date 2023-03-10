import 'package:get/get.dart';
import 'package:mechBazzar/modules/cart/controller/cart_controller.dart';

import '../controller/history_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(
      () => HistoryController(),
    );
  }
}
