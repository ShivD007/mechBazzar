import 'package:flutter/material.dart';
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
        if (topWidget != null) topWidget!,
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: scrollDirection,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ItemCard();
            },
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) => CustomSpacers.width10,
          ),
        )
      ],
    );
  }
}
