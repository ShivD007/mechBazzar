import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechbazaar/core/app_colors.dart';
import 'package:mechbazaar/core/text_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RedButton extends StatelessWidget {
  // Text to show
  final String text;

  // Callback method to notify the button click event
  final dynamic _onTapCallback;

  // Using to enable and disable the button
  final bool isDisables;

  // Defining the text color
  final Color textColor;

  // Defining the background color
  final Color backgroundColor;
  final double? width;

  const RedButton(this.text, this._onTapCallback,
      {this.isDisables = false,
      this.textColor = AppColors.COLOR_WHITE,
      this.backgroundColor = AppColors.COLOR_GREEN,
      this.width = double.infinity});

  //region: Overridden functions
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: isDisables
            ? null
            : () {
                _onTapCallback();
              },
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(
            isDisables ? AppColors.COLOR_GREY_400 : backgroundColor,
          ),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          )),
        ),
        child: Container(
            width: width,
            alignment: Alignment.center,
            height: 48.h,
            //decoration: BoxDecoration(borderRadius: ),
            child: text.h25(fontSize: 18.sp, textColor: AppColors.COLOR_WHITE)));
  }
  //endregion
}
