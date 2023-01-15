import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechBazzar/atoms/currency.dart';
import 'package:mechBazzar/core/constants/value_constants.dart';
import 'package:mechBazzar/core/custom_spacers.dart';
import 'package:mechBazzar/core/text_extension.dart';
import '../core/Images/custom_network_image.dart';
import '../core/app_colors.dart';

class HorizontalItemCard extends StatelessWidget {
  const HorizontalItemCard(
      {Key? key,
      required this.itemName,
      required this.imagePath,
      required this.onTap,
      this.qty,
      this.showTap = true,
      this.onDelete,
      this.onUpdateCart})
      : super(key: key);

  final String itemName;
  final String imagePath;
  final VoidCallback onTap;
  final int? qty;
  final bool? showTap;
  final VoidCallback? onDelete;
  final Function(int val)? onUpdateCart;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.r),
     
      child: Container(
        height: 130.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(VALUE_INPUT_BORDER_RADIUS),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomNetworkImageView.square(
                fit: BoxFit.cover,
                height: 130.h,
                width: onDelete==null?150.w:120.w,
                imagePath: imagePath),
            CustomSpacers.width8,
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: itemName.body16(
                                  textAlign: TextAlign.start,
                                  fontSize: 18.sp,
                                  maxLines: 2,
                                  textColor: AppColors.COLOR_GREY_900),
                            ),
                          ),
                          if (onDelete != null)
                            IconButton(
                                onPressed: onDelete,
                                icon: Icon(
                                  Icons.delete,
                                  color: AppColors.COLOR_RED,
                                ))
                        ],
                      ),
                    ),
                    CustomSpacers.height10,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: CurrencyView(
                        currentPrice: 5454,
                        previousPrice: 455,
                      ),
                    ),
                      CustomSpacers.height10,

                    if (qty != null && onUpdateCart != null) ...[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          children: [
                            cta(()=>onUpdateCart!(qty! - 1), Icons.remove),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: "$qty".h25(
                                  fontSize: 16.sp,
                                  textColor: AppColors.COLOR_GREY_900),
                            ),
                            cta(()=>onUpdateCart!(qty! + 1), Icons.add),
                          ],
                        ),
                      ),
                    ],
                    if (qty != null && onUpdateCart == null) ...[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: "Qty: $qty".h25(
                            fontSize: 16.sp,
                            textColor: AppColors.COLOR_GREY_900),
                      ),
                     
                    ],
                    if (showTap!)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w),
                        child: cta(onTap, Icons.chevron_right),
                      ),
                      CustomSpacers.height10,

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cta(dynamic tap, IconData icon) {
    return GestureDetector(
      onTap:tap,
      child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 30.w,
            width: 30.w,
            decoration: BoxDecoration(
                color: AppColors.COLOR_GREEN,
                borderRadius: BorderRadius.circular(VALUE_INPUT_BORDER_RADIUS)),
            child: Icon(
              icon,
              color: AppColors.COLOR_WHITE,
            ),
          )),
    );
  }
}
