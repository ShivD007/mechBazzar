import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechBazzar/atoms/clickable_text.dart';
import 'package:mechBazzar/atoms/red_button.dart';
import 'package:mechBazzar/core/app_colors.dart';
import 'package:mechBazzar/core/custom_input.dart';
import 'package:mechBazzar/core/custom_spacers.dart';
import 'package:mechBazzar/core/text_extension.dart';
import 'package:mechBazzar/modules/profile/controllers/forget_pass_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/image_constants.dart';
import '../../../core/constants/string_constants.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: AppColors.COLOR_GREEN.withOpacity(0.8),
        image: DecorationImage(
            alignment: Alignment.bottomCenter, image: AssetImage(SPLASH_CIRCLE_CUTOUT), fit: BoxFit.fitWidth),
      ),
      child: Scaffold(
        body: SafeArea(
            child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(22.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomSpacers.height24,
                  Align(
                      alignment: Alignment.topCenter, child: forgetPasswordTitle.h25(textColor: AppColors.COLOR_WHITE)),
                  CustomSpacers.height20,
                  Align(
                      alignment: Alignment.topCenter,
                      child: forgetPasswordMsg.h25(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          textColor: AppColors.COLOR_WHITE,
                          textAlign: TextAlign.start)),
                  CustomSpacers.height104,
                  CustomInput(
                    textStyle: TextStyle(color: AppColors.COLOR_WHITE),
                    hintStyle: TextStyle(color: AppColors.COLOR_WHITE),
                    fillColor: AppColors.COLOR_LIGHT_GREEN.withOpacity(0.5),
                    controller: controller.emailController,
                    prefixIcon: Icon(Icons.email),
                    placeholder: "$email/$mobileNumber ",
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return enterEmail;
                      }
                      return null;
                    },
                  ),
                  CustomSpacers.height40,
                  SizedBox(
                    height: 55.h,
                    child: RedButton(
                      submit,
                      controller.onSubmit,
                      backgroundColor: AppColors.COLOR_LIGHT_GREEN.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
