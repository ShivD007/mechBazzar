import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechbazaar/atoms/red_button.dart';
import 'package:mechbazaar/core/app_colors.dart';
import 'package:mechbazaar/core/custom_appbar_with_back_button.dart';
import 'package:mechbazaar/core/custom_input.dart';
import 'package:mechbazaar/core/custom_spacers.dart';
import 'package:mechbazaar/core/text_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechbazaar/modules/profile/controllers/profileController.dart';
import '../../../core/constants/string_constants.dart';
import '../../../core/custom_card.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBack(
        title: profile,
      ),
      body: GetBuilder(
          init: controller,
          id: 'updateUI',
          builder: (_) {
            return SafeArea(
                child: Form(
              key: controller.formKey1,
              child: Padding(
                padding: EdgeInsets.all(16.h),
                child: CustomCard(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomSpacers.height12,
                        CustomInput(
                          controller: controller.nameController,
                          prefixIcon: Icon(Icons.person),
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
                          controller: controller.emailController,
                          isReadOnly: true,
                          fillColor: AppColors.COLOR_GREY_300,
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
                          prefixIcon: Icon(Icons.location_city),
                          placeholder: address,
                          minLine: 1,
                          maxLines: 4,
                          maxLength: 200,
                          controller: controller.addressController,
                        ),
                        CustomSpacers.height32,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RedButton(
                              editProfile,
                              controller.onEdit,
                              width: 130.w,
                            ),
                            CustomSpacers.width10,
                            RedButton(
                              deleteAccount,
                              controller.onDeleteUser,
                              width: 140.w,
                            ),
                          ],
                        ),
                        CustomSpacers.height12,
                      ],
                    ),
                  ),
                ),
              ),
            ));
          }),
    );
  }
}
