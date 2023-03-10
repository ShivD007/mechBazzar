import 'package:get/get.dart';
import 'package:mechBazzar/modules/profile/controllers/forget_pass_controller.dart';


class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasswordController>(
      () => ForgetPasswordController(),
    );
  }
}
