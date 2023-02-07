import 'package:get/get.dart';
import 'package:mechbazaar/modules/profile/controllers/forget_pass_controller.dart';


class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasswordController>(
      () => ForgetPasswordController(),
    );
  }
}
