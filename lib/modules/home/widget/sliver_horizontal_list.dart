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
          height: 250.h,
          child: ItemListView(
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
