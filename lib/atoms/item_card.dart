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
        height: 250.h,
        width: 290.w,
        decoration: BoxDecoration(
          color: AppColors.COLOR_WHITE,
          borderRadius: BorderRadius.circular(VALUE_INPUT_BORDER_RADIUS),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomNetworkImageView.square(fit: BoxFit.contain, height: 176.h, width: 300.w, imagePath: imgPath),
            CustomSpacers.height8,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: title.h25(
                  fontSize: 15.sp,
                  textColor: AppColors.COLOR_GREY_900,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              child: CurrencyView(
                currentPrice: currentPrice,
                previousPrice: previousPrice,
              ),
            ),
            SizedBox(
              height: 8.w,
            )
          ],
        ),
      ),
    );
  }
}
