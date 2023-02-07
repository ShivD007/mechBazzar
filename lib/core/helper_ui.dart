import 'package:mechbazaar/atoms/save_shared_pref.dart';
import 'package:mechbazaar/core/text_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';
import '../routes/custom_navigator.dart';
import 'app_colors.dart';

class HelperUI {
  static Widget getProgressIndicator() {
    return const Center(
      child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
          color: AppColors.COLOR_GREEN,
        ),
      ),
    );
  }

  static Widget getProgressGhost({height = 0.0, width = 0.0}) {
    return Shimmer.fromColors(
        baseColor: AppColors.COLOR_E7E5E5,
        highlightColor: AppColors.COLOR_F9F8F8,
        period: const Duration(seconds: 4),
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            color: AppColors.COLOR_F1EFEF,
          ),
        ));
  }

  showSnackbar(String message, [bool error=true]) {
    ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: message.body14(textColor: AppColors.COLOR_WHITE, textAlign: TextAlign.start),
      backgroundColor: error?AppColors.COLOR_RED:AppColors.COLOR_GREEN,
    ));
  }

  hideLoadingDialog() {
    Get.back();
    // Navigator.of(Get.context!, rootNavigator: true).pop();
  }

  showLoadingDialog([bool? barrierDismissible = true]) {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: barrierDismissible!,
    );
  }

   logout() async {
  
      await SavePreferences.clearAll();
      CustomNavigator.pushAndPopAll(Routes.login);
    
  }
}
