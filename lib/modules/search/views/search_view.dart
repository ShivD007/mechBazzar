import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../atoms/horizontal_item.dart';
import '../../../atoms/loading_horizontal_list.dart';
import '../../../core/app_colors.dart';
import '../../../core/custom_appbar_with_back_button.dart';
import '../../../core/custom_spacers.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/custom_navigator.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarWithBack(title: "Search"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                height: 80.h,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: CupertinoTextField(
                  controller: controller.textEditingController,
                  keyboardType: TextInputType.text,
                  placeholder: 'Search...',
                  placeholderStyle: TextStyle(
                    color: AppColors.COLOR_LIGHT_GREEN,
                  ),
                  onChanged: ((value) {
                    controller.isListLoading.value = true;
                    controller.debouncer.run(() {
                      if (value.isNotEmpty) {
                        controller.getProductList(value, 1);
                      } else {
                        controller.searchList.clear();
                        controller.isListLoading.value = false;
                      }
                    });
                  }),
                  suffix: Padding(
                    padding: EdgeInsets.fromLTRB(9.0.w, 6.0.h, 9.0.w, 6.0.h),
                    child: Icon(
                      Icons.search,
                      color: AppColors.COLOR_LIGHT_GREEN,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: AppColors.COLOR_WHITE,
                  ),
                ),
              ),
              Obx(
                () => Expanded(
                  child: controller.searchList.isEmpty
                      ? Center(
                          child: Text("No Item"),
                        )
                      : ListView.separated(
                          controller: controller.scrollController,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return controller.isListLoading.value
                                ? LoadingHorizontalItemCard()
                                : HorizontalItemCard(
                                    outOfStock: controller.searchList[index].stock == 0,
                                    itemName: controller.searchList[index].name.toString(),
                                    imagePath: "https:" + controller.searchList[index].photo.toString(),
                                    onTap: () {
                                      CustomNavigator.pushTo(Routes.productDetail,
                                          arguments: controller.searchList[index].id);
                                    },
                                    cPrice: controller.searchList[index].price,
                                    prevPrice: controller.searchList[index].previousPrice,
                                    stock: controller.searchList[index].stock,
                                  );
                          },
                          itemCount: controller.isListLoading.value ? 6 : controller.searchList.length,
                          separatorBuilder: (BuildContext context, int index) => CustomSpacers.height10,
                        ),
                ),
              ),
            ],
          ),
        ));
  }
}
