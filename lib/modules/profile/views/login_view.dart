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
import 'package:mechBazzar/routes/custom_navigator.dart';

import '../../../core/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      
      Padding(
        padding:  EdgeInsets.all(16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomSpacers.height24,

            Align(
              alignment: Alignment.centerLeft,
              child: welcomeBack.h25(textColor: AppColors.COLOR_GREEN)),
            CustomSpacers.height54,
            CustomInput(
              prefixIcon: Icon(Icons.email),

              placeholder: email,
              validator: (val){
            if(val!.isEmpty){
               return enterEmail;
             }
             return null;
            },),
            CustomSpacers.height12,

            CustomInput(
              prefixIcon: Icon(Icons.lock),
              isObscure: true,
              placeholder: password,
              validator: (val){
            if(val!.isEmpty){
               return enterPassword;
             }
             return null;
            },),
            CustomSpacers.height8,
            Align(alignment: Alignment.centerRight,
            child: ClickableTexts(title: forgetPassword.body14(), onClick: (){
              CustomNavigator.pushTo(Routes.forgetPassword);
            },),
            ),

            CustomSpacers.height16,
            RedButton(login, (){}),
            CustomSpacers.height8,
            Row(
              mainAxisAlignment:MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                dontHaveAccount.body14(),
                CustomSpacers.width8,
                
                ClickableTexts(title: signup.body16(textColor: AppColors.COLOR_GREEN), onClick: (){
              CustomNavigator.pushTo(Routes.signup);
            }),
              ],
            )
        ],),
      )
      ),
    );
    
    
    }
}