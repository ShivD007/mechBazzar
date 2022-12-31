import 'package:admin_jandhara/atoms/custom_carousel.dart';
import 'package:admin_jandhara/atoms/sliver_app_delegate.dart';
import 'package:admin_jandhara/core/app_colors.dart';
import 'package:admin_jandhara/core/custom_spacers.dart';
import 'package:admin_jandhara/modules/home/widget/sliver_custom_app_bar.dart';
import 'package:admin_jandhara/modules/home/widget/sliver_horizontal_list.dart';
import 'package:admin_jandhara/modules/home/widget/sliver_list_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../atoms/drawer_widget.dart';
import '../controllers/home_controller.dart';

final GlobalKey<ScaffoldState> home_key = GlobalKey();

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  SliverPersistentHeader makeHeader(Widget child, double height) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: height,
        maxHeight: height,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: home_key,
      drawer: DrawerWidget(),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          const SliverCustomAppBar(),
          makeHeader(Container(color: AppColors.COLOR_WHITE, child: CustomSpacers.height16), 16),
          makeHeader(_crouselWidget(), 200),
          SliverToBoxAdapter(child: CustomSpacers.height12),
          const SliverListTitle(
            text: "Electric Tool & Equipment",
          ),
          SliverToBoxAdapter(child: CustomSpacers.height6),
          const SliverHorizontalList(),
          SliverToBoxAdapter(child: CustomSpacers.height16),
          const SliverListTitle(
            text: "Office Stationery & Supplies",
          ),
          SliverToBoxAdapter(child: CustomSpacers.height6),
          const SliverHorizontalList(),
          SliverToBoxAdapter(child: CustomSpacers.height16),
          const SliverListTitle(
            text: "Industrial Tools & Construction",
          ),
          SliverToBoxAdapter(child: CustomSpacers.height6),
          const SliverHorizontalList(),
          SliverToBoxAdapter(child: CustomSpacers.height16),
          const SliverListTitle(
            text: "Healthcare, Medical & Lab Supplies",
          ),
          SliverToBoxAdapter(child: CustomSpacers.height6),
          const SliverHorizontalList(),
          SliverToBoxAdapter(child: CustomSpacers.height16),
          const SliverListTitle(
            text: "Agriculture & Gardening",
          ),
          SliverToBoxAdapter(child: CustomSpacers.height6),
          const SliverHorizontalList(),
          SliverToBoxAdapter(child: CustomSpacers.height16),
          const SliverListTitle(
            text: "Safety Supplies",
          ),
          SliverToBoxAdapter(child: CustomSpacers.height6),
          const SliverHorizontalList(),
        ],
      ),
    );
  }

  Container _crouselWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      color: AppColors.COLOR_WHITE,
      child: CustomCarousel(
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
    );
  }
}
