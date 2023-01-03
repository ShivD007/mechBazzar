import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechBazzar/atoms/horizontal_list.dart';
import 'package:mechBazzar/atoms/item_card.dart';

import '../core/custom_spacers.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({Key? key, this.scrollDirection = Axis.vertical, this.topWidget}) : super(key: key);
  final Axis scrollDirection;
  final Widget? topWidget;
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
              return HorizontalItemCard();
            },
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) => CustomSpacers.height10,
          ),
        )
      ],
    );
  }
}
