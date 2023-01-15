import 'package:get/get.dart';
import 'package:mechBazzar/modules/cart%20copy/controller/place_order_controller.dart';
import 'package:mechBazzar/modules/cart/controller/cart_controller.dart';

class PlaceOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaceOrderController>(
      () => PlaceOrderController(),
    );
  }
}
