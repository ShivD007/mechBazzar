import 'package:admin_jandhara/atoms/custom_carousel.dart';
import 'package:admin_jandhara/core/app_colors.dart';
import 'package:admin_jandhara/core/custom_spacers.dart';
import 'package:admin_jandhara/core/text_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'dart:math' as math;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  SliverPersistentHeader makeHeader(Widget child, double height) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: height,
        maxHeight: height,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            title: Text("Mechabazzar"),
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_rounded),
                onPressed: () {},
              )
            ],
            expandedHeight: 150.0.h,
            titleSpacing: 0,
            elevation: 1.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: kToolbarHeight,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0.h),
                    child: SizedBox(
                      height: 36.0,
                      width: double.infinity,
                      child: CupertinoTextField(
                        readOnly: true,
                        keyboardType: TextInputType.text,
                        placeholder: 'Search...',
                        placeholderStyle: const TextStyle(
                          color: AppColors.COLOR_LIGHT_GREEN,
                          fontSize: 14.0,
                        ),
                        suffix: const Padding(
                          padding: EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                          child: Icon(
                            Icons.search,
                            color: AppColors.COLOR_LIGHT_GREEN,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: AppColors.COLOR_WHITE,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          makeHeader(CustomSpacers.height16, 16),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: makeHeader(
                CustomCarousel(
                    height: 200.h,
                    autoPlay: true,
                    enabledIndicatorRadius: 10.w,
                    disabledIndicatorRadius: 6.w,
                    showBottomIndicator: true,
                    spaceBeforeIndicator: 5.h,
                    widgetList: [
                      Container(
                        color: Colors.amber,
                      ),
                      Container(
                        color: Colors.blue,
                      ),
                      Container(
                        color: Colors.red,
                      ),
                      Container(
                        color: Colors.green,
                      ),
                    ]),
                200),
          ),
          SliverToBoxAdapter(child: CustomSpacers.height12),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverToBoxAdapter(
              child: "Electric Tool & Equipment".body16(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.left,
                  textColor: AppColors.COLOR_GREY_900),
            ),
          ),
          SliverToBoxAdapter(child: CustomSpacers.height6),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 200.h,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200.h,
                      width: 200,
                      color: Colors.pink,
                    );
                  },
                  itemCount: 5,
                  separatorBuilder: (BuildContext context, int index) =>
                      CustomSpacers.width10,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: CustomSpacers.height16),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverToBoxAdapter(
              child: "Office Stationery & Supplies".body16(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.left,
                  textColor: AppColors.COLOR_GREY_900),
            ),
          ),
          SliverToBoxAdapter(child: CustomSpacers.height6),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 200.h,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200.h,
                      width: 200,
                      color: Colors.pink,
                    );
                  },
                  itemCount: 5,
                  separatorBuilder: (BuildContext context, int index) =>
                      CustomSpacers.width10,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: CustomSpacers.height16),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverToBoxAdapter(
              child: "Industrial Tools & Construction".body16(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.left,
                  textColor: AppColors.COLOR_GREY_900),
            ),
          ),
          SliverToBoxAdapter(child: CustomSpacers.height6),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 200.h,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200.h,
                      width: 200,
                      color: Colors.pink,
                    );
                  },
                  itemCount: 5,
                  separatorBuilder: (BuildContext context, int index) =>
                      CustomSpacers.width10,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: CustomSpacers.height16),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverToBoxAdapter(
              child: "Healthcare, Medical & Lab Supplies".body16(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.left,
                  textColor: AppColors.COLOR_GREY_900),
            ),
          ),
          SliverToBoxAdapter(child: CustomSpacers.height6),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 200.h,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200.h,
                      width: 200,
                      color: Colors.pink,
                    );
                  },
                  itemCount: 5,
                  separatorBuilder: (BuildContext context, int index) =>
                      CustomSpacers.width10,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: CustomSpacers.height16),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverToBoxAdapter(
              child: "Agriculture & Gardening".body16(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.left,
                  textColor: AppColors.COLOR_GREY_900),
            ),
          ),
          SliverToBoxAdapter(child: CustomSpacers.height6),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 200.h,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200.h,
                      width: 200,
                      color: Colors.pink,
                    );
                  },
                  itemCount: 5,
                  separatorBuilder: (BuildContext context, int index) =>
                      CustomSpacers.width10,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: CustomSpacers.height16),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverToBoxAdapter(
              child: "Safety Supplies".body16(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.left,
                  textColor: AppColors.COLOR_GREY_900),
            ),
          ),
          SliverToBoxAdapter(child: CustomSpacers.height6),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 200.h,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200.h,
                      width: 200,
                      color: Colors.pink,
                    );
                  },
                  itemCount: 5,
                  separatorBuilder: (BuildContext context, int index) =>
                      CustomSpacers.width10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
