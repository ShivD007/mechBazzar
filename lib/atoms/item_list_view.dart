import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechBazzar/atoms/horizontal_list.dart';
import 'package:mechBazzar/atoms/item_card.dart';
import 'package:mechBazzar/core/models/product_res_model.dart';

import '../core/custom_spacers.dart';
import 'loading_horizontal_list.dart';

class BrandCategoryListView extends StatelessWidget {
  const BrandCategoryListView(
      {Key? key, this.scrollDirection = Axis.vertical, this.topWidget, required this.itemList, required this.isLoading})
      : super(key: key);
  final Axis scrollDirection;
  final Widget? topWidget;
  final List<Product?> itemList;
  final bool isLoading;
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
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: scrollDirection,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return isLoading
                  ? LoadingHorizontalItemCard()
                  : HorizontalItemCard(
                      itemName: itemList[index]!.name.toString(),
                      imagePath: "https:" + itemList[index]!.photo.toString(),
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
