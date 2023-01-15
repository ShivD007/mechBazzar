import 'package:flutter/rendering.dart';
import 'package:mechBazzar/atoms/horizontal_item.dart';
import 'package:mechBazzar/core/custom_spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../atoms/item_card.dart';
import '../../../atoms/item_list_view.dart';

class SliverHorizontalList extends StatelessWidget {
  const SliverHorizontalList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 220.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ItemCard(
              );
            },
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) => CustomSpacers.width10,
          ),
        ),
      ),
    );
  }
}
