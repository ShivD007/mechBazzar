import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechbazaar/atoms/red_button.dart';
import 'package:mechbazaar/core/app_colors.dart';
import 'package:mechbazaar/core/custom_input.dart';
import 'package:mechbazaar/core/custom_spacers.dart';
import 'package:mechbazaar/core/text_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechbazaar/modules/profile/controllers/signup_controller.dart';
import '../../../core/constants/image_constants.dart';
import '../../../core/constants/string_constants.dart';

class SignUpView extends GetView<SignupController> {
  const SignUpView({Key? key}) : super(key: key);

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
        backgroundColor: Colors.transparent,
        // bottomNavigationBar: Padding(
        //   padding: EdgeInsets.fromLTRB(22.w, 2.h, 22.w, 16.w + MediaQuery.of(context).viewInsets.bottom),
        //   child: RedButton(submit, controller.onSubmit),
        // ),
        body: SafeArea(
            child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSpacers.height24,
                  signup.h25(textColor: AppColors.COLOR_WHITE),
                  CustomSpacers.height32,
                  CustomInput(
                    textStyle: TextStyle(color: AppColors.COLOR_WHITE),
                    hintStyle: TextStyle(color: AppColors.COLOR_WHITE),
                    fillColor: AppColors.COLOR_LIGHT_GREEN.withOpacity(0.5),
                    controller: controller.nameController,
                    prefixIcon: Icon(Icons.person, color: AppColors.COLOR_WHITE),
                    placeholder: name,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))],
                    validator: (val) {
                      if (val!.isEmpty) {
                        return enterYourName;
                      }
                      return null;
                    },
                  ),
                  CustomSpacers.height12,
                  CustomInput(
                    textStyle: TextStyle(color: AppColors.COLOR_WHITE),
                    hintStyle: TextStyle(color: AppColors.COLOR_WHITE),
                    fillColor: AppColors.COLOR_LIGHT_GREEN.withOpacity(0.5),
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(Icons.email, color: AppColors.COLOR_WHITE),
                    placeholder: email,
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
                    prefixIcon: Icon(Icons.phone, color: AppColors.COLOR_WHITE),
                    placeholder: mobileNumber,
                    maxLength: 10,
                    controller: controller.phoneController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (val) {
                      if (val!.isEmpty || val.length < 10) {
                        return entertenDigitMobileNumber;
                      }
                      return null;
                    },
                  ),
                  CustomSpacers.height12,
                  CustomInput(
                    textStyle: TextStyle(color: AppColors.COLOR_WHITE),
                    hintStyle: TextStyle(color: AppColors.COLOR_WHITE),
                    fillColor: AppColors.COLOR_LIGHT_GREEN.withOpacity(0.5),
                    prefixIcon: Icon(Icons.location_city, color: AppColors.COLOR_WHITE),
                    placeholder: address,
                    minLine: 1,
                    maxLines: 4,
                    maxLength: 200,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return enterAddress;
                      }
                      return null;
                    },
                    controller: controller.addressController,
                  ),
                  CustomSpacers.height12,
                  Obx(
                    () => CustomInput(
                      textStyle: TextStyle(color: AppColors.COLOR_WHITE),
                      hintStyle: TextStyle(color: AppColors.COLOR_WHITE),
                      fillColor: AppColors.COLOR_LIGHT_GREEN.withOpacity(0.5),
                      controller: controller.password,
                      prefixIcon: Icon(Icons.lock, color: AppColors.COLOR_WHITE),
                      isObscure: !controller.passwordVisible.value,
                      suffixIcon: IconButton(
                          icon: Icon(
                            controller.passwordVisible.value ? Icons.visibility : Icons.visibility_off,
                            color: AppColors.COLOR_WHITE,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            controller.passwordVisible.value = !controller.passwordVisible.value;
                          }),
                      placeholder: password,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return enterPassword;
                        }
                        return null;
                      },
                    ),
                  ),
                  CustomSpacers.height12,
                  CustomInput(
                    textStyle: TextStyle(color: AppColors.COLOR_WHITE),
                    hintStyle: TextStyle(color: AppColors.COLOR_WHITE),
                    fillColor: AppColors.COLOR_LIGHT_GREEN.withOpacity(0.5),
                    prefixIcon: Icon(Icons.lock, color: AppColors.COLOR_WHITE),
                    isObscure: true,
                    placeholder: confirmPassword,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return enterPassword;
                      } else if (controller.password.text != val) {
                        return passwordNotMatch;
                      }
                      return null;
                    },
                  ),
                  CustomSpacers.height20,
                  SizedBox(
                    height: 55.h,
                    child: RedButton(
                      signup.toUpperCase(),
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
