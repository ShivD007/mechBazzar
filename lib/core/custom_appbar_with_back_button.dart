import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../routes/custom_navigator.dart';
import 'app_colors.dart';
import 'constants/style_constants.dart';
import 'custom_spacers.dart';

class CustomAppBarWithBack extends StatefulWidget
    implements PreferredSizeWidget {
  final dynamic? title;
  final IconData? leadingIcon;
  final OnClickBack;
  final Widget? actionWidget;
  final double? toolbarHeight;
  final bool? isCenterAppicon;
  CustomAppBarWithBack({
    Key? key,
    this.title = "",
    this.actionWidget,
    this.leadingIcon,
    this.OnClickBack,
    this.toolbarHeight = kToolbarHeight,
    this.isCenterAppicon = false,
  }) : super(key: key);

  @override
  _CustomAppBarWithBackState createState() => _CustomAppBarWithBackState();
  @override
  Size get preferredSize => Size.fromHeight(60.h);
}

class _CustomAppBarWithBackState extends State<CustomAppBarWithBack> {
  @override
  Widget build(BuildContext context) =>
      OrientationBuilder(builder: (context, _) {
        return AppBar(
          backgroundColor: AppColors.COLOR_WHITE,
          elevation: 0,
          titleSpacing: 0,
          centerTitle: true,
          toolbarHeight: 60.h,
          automaticallyImplyLeading: false,
          leading: widget.leadingIcon != null
              ? GestureDetector(
                  onTap: () {
                    widget.OnClickBack == null
                        ? CustomNavigator.pop()
                        : widget.OnClickBack();
                  },
                  child: Icon(
                    widget.leadingIcon,
                    color: AppColors.COLOR_GREY_900,
                  ),
                )
              : const BackButton(color: AppColors.COLOR_BLACK),
          actions: widget.actionWidget != null
              ? [widget.actionWidget!, CustomSpacers.width20]
              : [],
          title: widget.title is String
              ? Text(
                  widget.title!,
                  style: Style.styleHeaderCardHeadingMontserrat,
                )
              : widget.title,
        );
      });
}
