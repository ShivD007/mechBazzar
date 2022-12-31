import 'package:mechBazzar/core/constants/value_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final bool? showShadow;
  final double? elevation;
  const CustomCard(
      {Key? key,
      required this.child,
      this.borderRadius,
      this.showShadow = true,
      this.horizontalPadding,
      this.elevation,
      this.verticalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 0.0,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 16.w,
            vertical: verticalPadding ?? 16.h),
        decoration: BoxDecoration(
            color: AppColors.COLOR_WHITE,
            borderRadius: BorderRadius.circular(
                borderRadius ?? VALUE_INPUT_BORDER_RADIUS),
            boxShadow:
                // showShadow!
                //     ?
                [
              BOXSHADOW(bRadius: 12),
            ]
            // : []
            ),
        child: child,
      ),
    );
  }
}
