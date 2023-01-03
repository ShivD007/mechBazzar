import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mechBazzar/core/app_colors.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({
    Key? key,
    required this.length,
    required this.controller,
    required this.tabs,
    required this.children,
    // this.bottomPadding,
    this.appBar,
    this.physics,
    this.bottomWidget,
    this.heading,
  }) : super(key: key);

  final int length;
  final TabController controller;
  final List<Widget> tabs;
  final List<Widget> children;
  final PreferredSizeWidget? appBar;
  final Widget? bottomWidget;
  final String? heading;
  final ScrollPhysics? physics;

  //region: Override functions
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: length,
      child: Scaffold(
        backgroundColor: AppColors.COLOR_GREY_200,
        appBar: appBar,
        bottomNavigationBar: bottomWidget,
        body: Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45,
                margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.h),
                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(8.0)),
                child: TabBar(
                  controller: controller,
                  isScrollable: true,
                  indicator: BoxDecoration(color: Colors.green[300], borderRadius: BorderRadius.circular(8.0)),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: tabs,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: TabBarView(
                    children: children,
                    physics: physics,
                    controller: controller,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
