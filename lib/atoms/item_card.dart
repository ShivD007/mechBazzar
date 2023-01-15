import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechBazzar/atoms/currency.dart';
import 'package:mechBazzar/core/Images/custom_network_image.dart';
import 'package:mechBazzar/core/app_colors.dart';
import 'package:mechBazzar/core/constants/string_constants.dart';
import 'package:mechBazzar/core/constants/value_constants.dart';
import 'package:mechBazzar/core/custom_spacers.dart';
import 'package:mechBazzar/core/text_extension.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {Key? key, required this.title, required this.imgPath, required this.currentPrice, required this.previousPrice})
      : super(key: key);

  final String title;
  final String imgPath;
  final double currentPrice;
  final double previousPrice;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 230.h,
        width: 280.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(VALUE_INPUT_BORDER_RADIUS),
            border: Border.all(color: AppColors.COLOR_GREY_900, width: 0.5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomNetworkImageView.square(fit: BoxFit.cover, height: 156.h, width: 280.w, imagePath: imgPath),
            CustomSpacers.height8,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: title.h25(
                  fontSize: 14.sp,
                  textColor: AppColors.COLOR_GREY_900,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: CurrencyView(
                currentPrice: currentPrice,
                previousPrice: previousPrice,
              ),
            )
          ],
        ),
      ),
    );
  }
}
