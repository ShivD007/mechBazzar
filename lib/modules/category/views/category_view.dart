import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mechBazzar/atoms/item_list_view.dart';
import 'package:mechBazzar/core/app_colors.dart';
import 'package:mechBazzar/core/custom_appbar_with_back_button.dart';
import 'package:mechBazzar/core/text_extension.dart';
import '../../../atoms/custom_tab_bar_view.dart';
import '../../../core/custom_spacers.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTabBarView(
      appBar: CustomAppBarWithBack(title: "Categories"),
      controller: controller.tabController,
      length: 3,
      tabs: controller.category
          .map((e) => Tab(
                text: e,
              ))
          .toList(),
      children: controller.category
          .map(
            (e) => Obx(
              () => ItemListView(
                itemList: controller.selectedList.value,
                topWidget: SizedBox(
                  height: 50.h,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => ChoiceChip(
                          padding: EdgeInsets.all(8),
                          label:
                              controller.subCategory[index].body16(fontSize: 14.sp, textColor: AppColors.COLOR_BLACK),
                          selectedColor: AppColors.COLOR_LIGHT_GREEN,
                          backgroundColor: AppColors.COLOR_GREY_300,
                          selected: controller.slectedSubCategory.value == controller.subCategory[index],
                          onSelected: (bool selected) {
                            controller.slectedSubCategory.value = controller.subCategory[index];
                            controller.selectedList.value =
                                controller.selectedList.contains(1) ? controller.temp2 : controller.temp1;

                            controller.selectedList.refresh();
                          },
                        ),
                      );
                    },
                    itemCount: controller.subCategory.length,
                    separatorBuilder: (BuildContext context, int index) => CustomSpacers.width10,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
