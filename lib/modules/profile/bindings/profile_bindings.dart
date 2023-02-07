import 'package:get/get.dart';
import 'package:mechbazaar/modules/profile/controllers/profileController.dart';


class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
