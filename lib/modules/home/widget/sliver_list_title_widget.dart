import 'package:admin_jandhara/core/app_colors.dart';
import 'package:admin_jandhara/core/text_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverListTitle extends StatelessWidget {
  const SliverListTitle({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverToBoxAdapter(
        child: text.body16(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.left,
            textColor: AppColors.COLOR_GREY_900),
      ),
    );
  }
}
