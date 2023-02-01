import 'package:flutter/rendering.dart';
import 'package:mechBazzar/atoms/horizontal_item.dart';
import 'package:mechBazzar/core/custom_spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../atoms/item_card.dart';
import '../../../atoms/item_list_view.dart';
import '../../../core/models/product_res_model.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/custom_navigator.dart';

class SliverHorizontalList extends StatelessWidget {
  const SliverHorizontalList({
    Key? key,
    required this.itemList,
  }) : super(key: key);

  final List<Product> itemList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              CustomNavigator.pushTo(Routes.productDetail, arguments: itemList[index].id);
            },
            child: ItemCard(
              title: itemList[index].name.toString(),
              imgPath: "https:" + itemList[index].photo.toString(),
              currentPrice: itemList[index].price.toDouble(),
              previousPrice: itemList[index].previousPrice.toDouble(),
            ),
          );
        },
        itemCount: itemList.length,
        separatorBuilder: (BuildContext context, int index) => CustomSpacers.width10,
      ),
    );
  }
}
