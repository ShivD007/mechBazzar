import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechBazzar/core/constants/value_constants.dart';
import 'package:mechBazzar/core/custom_spacers.dart';

import '../core/helper_ui.dart';

class LoadingHorizontalItemCard extends StatelessWidget {
  const LoadingHorizontalItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        height: 120.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(VALUE_INPUT_BORDER_RADIUS),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            HelperUI.getProgressGhost(height: 120.h, width: 150.w),
            CustomSpacers.width8,
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: HelperUI.getProgressGhost(height: 20.h, width: 200.w),
                      ),
                    ),
                    CustomSpacers.height10,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: HelperUI.getProgressGhost(height: 18.h, width: 80.w),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: HelperUI.getProgressGhost(height: 30.h, width: 30.w),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
