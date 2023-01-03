import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechBazzar/core/app_colors.dart';
import 'package:mechBazzar/core/custom_spacers.dart';
import 'package:mechBazzar/core/text_extension.dart';

import '../core/constants/string_constants.dart';

class CurrencyView extends StatelessWidget {
  const CurrencyView({Key? key, required this.currentPrice, this.previousPrice})
      : super(key: key);
  final double currentPrice;
  final double? previousPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        (currency+currentPrice.toStringAsFixed(2)).h25(fontSize: 16.sp,textColor: AppColors.COLOR_GREY_900),
        if(previousPrice!=null)...[
          CustomSpacers.width8,
        (currency+ previousPrice!.toStringAsFixed(2)).body14(textColor: AppColors.COLOR_GREY_600,decoration: TextDecoration.lineThrough)
      ]],
    );
  }
}
