import 'package:get/get.dart';
import 'package:mechBazzar/modules/profile/controllers/forget_pass_controller%20copy.dart';

import '../controllers/signup_controller.dart';


class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
  }
}
