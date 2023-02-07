import 'package:get/get.dart';
import 'package:mechbazaar/modules/cart/controller/cart_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put<CartController>(
       CartController(),
    );
  }
}
