import 'dart:developer';

import 'package:get/get.dart';
import 'package:mechBazzar/modules/home/model/home_list_model.dart';
import 'package:mechBazzar/modules/home/repository/home_repo.dart';
import '../../../core/helper_ui.dart';

class HomeController extends GetxController with HelperUI {
  RxBool isInitialLoading = false.obs;
  late HomeListModel homeListModel;
  @override
  Future<void> onInit() async {
    isInitialLoading.value = true;
    await getHomeList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getHomeList() async {
    await HomeRepo.getHomeList(onError: (e) {
      isInitialLoading.value = false;
      HelperUI().showSnackbar(e.toString());
    }, onSuccess: (response) async {
      homeListModel = HomeListModel.fromJson(response);

      isInitialLoading.value = false;
    });
  }
}
