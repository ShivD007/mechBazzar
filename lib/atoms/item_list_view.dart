import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechBazzar/atoms/horizontal_item.dart';
import 'package:mechBazzar/atoms/item_card.dart';
import 'package:mechBazzar/core/models/product_res_model.dart';
import 'package:mechBazzar/core/text_extension.dart';
import 'package:mechBazzar/routes/app_pages.dart';
import 'package:mechBazzar/routes/custom_navigator.dart';

import '../core/app_colors.dart';
import '../core/custom_spacers.dart';
import 'loading_horizontal_list.dart';

class BrandCategoryListView extends StatelessWidget {
  const BrandCategoryListView(
      {Key? key,
      this.scrollDirection = Axis.vertical,
      this.topWidget,
      required this.itemList,
      required this.isLoading,
      required this.scrollController})
      : super(key: key);
  final Axis scrollDirection;
  final Widget? topWidget;
  final List<Product> itemList;
  final bool isLoading;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (topWidget != null)
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: topWidget!,
          ),
        Expanded(
          child: itemList.isEmpty
              ? Center(
                  child: "No data found !".body16(textColor: AppColors.COLOR_GREY_600),
                )
              : ListView.separated(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: scrollDirection,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return isLoading
                        ? LoadingHorizontalItemCard()
                        : HorizontalItemCard(
                            outOfStock: itemList[index].stock == 0,
                            itemName: itemList[index].name.toString(),
                            imagePath: "https:" + itemList[index].photo.toString(),
                            onTap: () {
                              CustomNavigator.pushTo(Routes.productDetail, arguments: itemList[index].id);
                            },
                            cPrice: itemList[index].price,
                            prevPrice: itemList[index].previousPrice,
                            stock: itemList[index].stock,
                          );
                  },
                  itemCount: isLoading ? 8 : itemList.length,
                  separatorBuilder: (BuildContext context, int index) => CustomSpacers.height10,
                ),
        )
      ],
    );
  }
}
