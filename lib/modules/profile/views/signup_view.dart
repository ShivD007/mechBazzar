import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechBazzar/atoms/clickable_text.dart';
import 'package:mechBazzar/atoms/red_button.dart';
import 'package:mechBazzar/core/app_colors.dart';
import 'package:mechBazzar/core/custom_input.dart';
import 'package:mechBazzar/core/custom_spacers.dart';
import 'package:mechBazzar/core/text_extension.dart';
import 'package:mechBazzar/modules/profile/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/string_constants.dart';

class SignUpView extends GetView<LoginController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(
            22.w, 2.h, 22.w, 16.w + MediaQuery.of(context).viewInsets.bottom),
        child: RedButton(submit, () {}),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomSpacers.height24,
              Align(
                  alignment: Alignment.centerLeft,
                  child: signup.h25(textColor: AppColors.COLOR_GREEN)),
              CustomSpacers.height54,
              CustomInput(
                prefixIcon: Icon(Icons.person),
                placeholder: name,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                ],
                validator: (val) {
                  if (val!.isEmpty) {
                    return enterYourName;
                  }
                  return null;
                },
              ),
              CustomSpacers.height12,
              CustomInput(
                prefixIcon: Icon(Icons.email),
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
                prefixIcon: Icon(Icons.phone),
                placeholder: mobileNumber,
                maxLength: 10,
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
                prefixIcon: Icon(Icons.lock),
                isObscure: true,
                placeholder: password,
                validator: (val) {
                  if (val!.isEmpty) {
                    return enterPassword;
                  }
                  return null;
                },
              ),
              CustomSpacers.height12,
              CustomInput(
                prefixIcon: Icon(Icons.lock),
                isObscure: true,
                placeholder: confirmPassword,
                validator: (val) {
                  if (val!.isEmpty) {
                    return enterPassword;
                  }
                  //ToDo
                  // else if(passwordNotMatch){
                  // return passwordNotMatch;
                  // }
                  return null;
                },
              ),
              CustomSpacers.height8,
            ],
          ),
        ),
      )),
    );
  }
}
