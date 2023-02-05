import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechBazzar/atoms/clickable_text.dart';
import 'package:mechBazzar/atoms/red_button.dart';
import 'package:mechBazzar/core/app_colors.dart';
import 'package:mechBazzar/core/custom_appbar_with_back_button.dart';
import 'package:mechBazzar/core/custom_input.dart';
import 'package:mechBazzar/core/custom_spacers.dart';
import 'package:mechBazzar/core/text_extension.dart';
import 'package:mechBazzar/modules/profile/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechBazzar/routes/custom_navigator.dart';

import '../../../core/constants/image_constants.dart';
import '../../../core/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

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
        // bottomNavigationBar: Padding(
        //     padding: EdgeInsets.fromLTRB(22.w, 0, 22.w, 16.h + MediaQuery.of(context).viewInsets.bottom),
        //     child: RedButton(login, controller.onSubmit)),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(22.h),
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomSpacers.height24,
                  Align(
                    alignment: Alignment.topRight,
                    child: ClickableTexts(
                      title: "Skip Login..".body14(textColor: AppColors.COLOR_WHITE),
                      onClick: () {
                        bool canPop = Navigator.canPop(context);
                        if (!canPop) {
                          CustomNavigator.pushReplacement(Routes.home);
                        }
                        CustomNavigator.pop();
                      },
                    ),
                  ),
                  login.h25(textColor: AppColors.COLOR_WHITE),
                  CustomSpacers.height54,
                  CustomInput(
                    textStyle: TextStyle(color: AppColors.COLOR_WHITE),
                    hintStyle: TextStyle(color: AppColors.COLOR_WHITE),
                    fillColor: AppColors.COLOR_LIGHT_GREEN.withOpacity(0.5),
                    controller: controller.emailController,
                    prefixIcon: Icon(
                      Icons.email,
                      color: AppColors.COLOR_WHITE,
                    ),
                    placeholder: email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return enterEmail;
                      }
                      return null;
                    },
                  ),
                  CustomSpacers.height12,
                  CustomInput(
                    textStyle: TextStyle(color: AppColors.COLOR_WHITE),
                    hintStyle: TextStyle(color: AppColors.COLOR_WHITE),
                    fillColor: AppColors.COLOR_LIGHT_GREEN.withOpacity(0.5),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: AppColors.COLOR_WHITE,
                    ),
                    showBorderColor: false,
                    isObscure: true,
                    controller: controller.passwordController,
                    placeholder: password,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return enterPassword;
                      }
                      return null;
                    },
                  ),
                  CustomSpacers.height8,
                  Align(
                    alignment: Alignment.centerRight,
                    child: ClickableTexts(
                      title: forgetPassword.body14(),
                      onClick: () {
                        CustomNavigator.pushTo(Routes.forgetPassword);
                      },
                    ),
                  ),
                  CustomSpacers.height54,
                  SizedBox(
                    height: 55.h,
                    child: RedButton(
                      login,
                      controller.onSubmit,
                      backgroundColor: AppColors.COLOR_LIGHT_GREEN.withOpacity(0.6),
                    ),
                  ),
                  CustomSpacers.height20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      dontHaveAccount.h25(fontSize: 18.sp),
                      CustomSpacers.width8,
                      ClickableTexts(
                          title: signup.h25(fontSize: 18.sp, textColor: AppColors.COLOR_WHITE),
                          onClick: () {
                            CustomNavigator.pushTo(Routes.signup);
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
