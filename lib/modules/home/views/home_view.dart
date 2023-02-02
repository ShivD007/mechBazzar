import 'package:mechBazzar/atoms/custom_carousel.dart';
import 'package:mechBazzar/atoms/sliver_app_delegate.dart';
import 'package:mechBazzar/core/Images/custom_network_image.dart';
import 'package:mechBazzar/core/app_colors.dart';
import 'package:mechBazzar/core/custom_spacers.dart';
import 'package:mechBazzar/core/text_extension.dart';
import 'package:mechBazzar/modules/home/widget/sliver_custom_app_bar.dart';
import 'package:mechBazzar/modules/home/widget/sliver_horizontal_list.dart';
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
      backgroundColor: AppColors.COLOR_GREY_200,
      key: home_key,
      drawer: DrawerWidget(),
      body: CustomScrollView(
       
        shrinkWrap: true,
        slivers: [
          const SliverCustomAppBar(),
          makeHeader(Container(color: AppColors.COLOR_GREY_200, child: CustomSpacers.height16), 16),
         
          SliverToBoxAdapter(child: _crouselWidget()),
          SliverToBoxAdapter(child: CustomSpacers.height12),
          Obx(
            () => controller.isInitialLoading.isTrue
                ? SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      if (controller.homeListModel.data[index].products.isEmpty) return SizedBox.shrink();
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            controller.homeListModel.data[index].categoryDetail.first.name.toString().body16(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                textAlign: TextAlign.left,
                                textColor: AppColors.COLOR_GREY_900),
                            CustomSpacers.height8,
                            SliverHorizontalList(
                              itemList: controller.homeListModel.data[index].products,
                            ),
                            CustomSpacers.height16
                          ],
                        ),
                      );
                    }, childCount: controller.homeListModel.data.length),
                  ),
          ),
        ],
      ),
    );
  }

  Container _crouselWidget() {
    List images = [
      "https://www.mechbazaar.com/assets/images/kaff.jpg",
      "https://www.mechbazaar.com/assets/images/printer.jpg",
      "https://www.mechbazaar.com/assets/images/ab.jpg",
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomCarousel(
          height: 210.h,
          autoPlay: true,
          enabledIndicatorRadius: 10.w,
          disabledIndicatorRadius: 6.w,
          showBottomIndicator: true,
          spaceBeforeIndicator: 5.h,
          widgetList: [
            ...images
                .map(
                  (e) => CustomNetworkImageView.square(fit: BoxFit.fill, imagePath: e),
                )
                .toList(),
          ]),
    );
  }
}
