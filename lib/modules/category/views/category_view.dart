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
    return Obx(
      () => controller.isInitialLoading.value
          ? Scaffold(
              appBar: CustomAppBarWithBack(title: "Categories"),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : CustomTabBarView(
              appBar: CustomAppBarWithBack(title: "Categories"),
              controller: controller.tabController,
              length: controller.category.length,
              tabs: controller.category
                  .map((e) => Tab(
                        text: e,
                      ))
                  .toList(),
              children: controller.category
                  .map(
                    (e) => Obx(
                      () => controller.isSubCategoryLoading.value
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ItemListView(
                              itemList: controller.selectedList,
                              isLoading: controller.isListLoading.value,
                              topWidget: SizedBox(
                                height: 50.h,
                                child: Obx(
                                  () => ChoiceChipList(
                                    chipList: controller.subCategory,
                                    selectedChip: controller.slectedSubCategory.value,
                                    onSelect: (index) {
                                      controller.slectedSubCategory.value = controller.subCategory[index];
                                    },
                                  ),
                                ),
                              ),
                            ),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}

class ChoiceChipList extends StatelessWidget {
  const ChoiceChipList({
    Key? key,
    required this.chipList,
    required this.selectedChip,
    required this.onSelect,
  }) : super(key: key);

  final List<String> chipList;
  final String selectedChip;
  final Function(int) onSelect;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ChoiceChip(
          padding: EdgeInsets.all(8),
          label: chipList[index].body16(fontSize: 14.sp, textColor: AppColors.COLOR_BLACK),
          //  controller.subCategory[index].body16(fontSize: 14.sp, textColor: AppColors.COLOR_BLACK),
          selectedColor: AppColors.COLOR_LIGHT_GREEN,
          backgroundColor: AppColors.COLOR_GREY_300,
          selected: selectedChip == chipList[index],
          onSelected: (bool selected) {
            onSelect(index);
            // controller.slectedSubCategory.value = controller.subCategory[index];

            // controller.selectedList.refresh();
          },
        );
      },
      itemCount: chipList.length,
      separatorBuilder: (BuildContext context, int index) => CustomSpacers.width10,
    );
  }
}
