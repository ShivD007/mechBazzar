import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mechBazzar/atoms/item_list_view.dart';
import 'package:mechBazzar/core/text_extension.dart';

import '../../../atoms/custom_tab_bar_view.dart';
import '../../../core/app_colors.dart';
import '../../../core/custom_appbar_with_back_button.dart';
import '../../../core/custom_spacers.dart';
import '../controllers/brand_controller.dart';

class BrandView extends GetView<BrandController> {
  const BrandView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isInitialLoading.value
        ? Scaffold(
            appBar: CustomAppBarWithBack(title: "Brands"),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : CustomTabBarView(
            appBar: CustomAppBarWithBack(title: "Brands"),
            controller: controller.tabController!,
            length: 3,
            tabs: controller.brands
                .map((e) => Tab(
                      text: e.name,
                    ))
                .toList(),
            children: controller.brands
                .map(
                  (e) => Obx(
                    () => BrandCategoryListView(
                      scrollController: controller.scrollController,
                      isLoading: controller.isListLoading.value,
                      itemList: controller.selectedList,
                    ),
                  ),
                )
                .toList(),
          ));
  }
}
