import 'package:get/get.dart';
import 'package:mechBazzar/modules/place_order/controller/place_order_controller.dart';

import '../../../core/razorpay_controller.dart';

class PlaceOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaceOrderController>(
      () => PlaceOrderController(),
    );

    Get.put(RazorpayController());
  }
}
