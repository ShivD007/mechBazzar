import 'package:get/get.dart';
import 'package:mechBazzar/modules/profile/controllers/profileController.dart';


class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
