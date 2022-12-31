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

import '../../../core/constants/string_constants.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(
            22.w, 2.h, 22.w, 16.w + MediaQuery.of(context).viewInsets.bottom),
        child: RedButton(submit, () {
          controller.onSubmit();
        }),
      ),
      body: SafeArea(
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
                  child: Padding(
            padding: EdgeInsets.all(22.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomSpacers.height24,
                Align(
                    alignment: Alignment.centerLeft,
                    child: forgetPasswordTitle.h25(
                        textColor: AppColors.COLOR_GREEN)),
                CustomSpacers.height10,
                Align(
                    alignment: Alignment.centerLeft,
                    child: forgetPasswordMsg.h25(
                      fontSize: 16.sp,
                        textColor: AppColors.COLOR_GREY_500,
                        textAlign: TextAlign.start)),
                CustomSpacers.height54,
                CustomInput(
                  controller: controller.emailController,
                  prefixIcon: Icon(Icons.email),
                  placeholder: email,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return enterEmail;
                    }
                    return null;
                  },
                ),
              ],
            ),
                  ),
                ),
          )),
    );
  }
}
