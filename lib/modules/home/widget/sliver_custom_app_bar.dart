import 'package:mechBazzar/core/app_colors.dart';
import 'package:mechBazzar/modules/home/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverCustomAppBar extends StatelessWidget {
  const SliverCustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      title: Text("Mechabazzar"),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          home_key.currentState?.openDrawer();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_rounded),
          onPressed: () {},
        )
      ],
      expandedHeight: 150.0.h,
      titleSpacing: 0,
      elevation: 1.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: kToolbarHeight,
            ),
            Padding(
              padding: EdgeInsets.all(16.0.h),
              child: SizedBox(
                height: 36.0,
                width: double.infinity,
                child: CupertinoTextField(
                  readOnly: true,
                  keyboardType: TextInputType.text,
                  placeholder: 'Search...',
                  placeholderStyle: const TextStyle(
                    color: AppColors.COLOR_LIGHT_GREEN,
                    fontSize: 14.0,
                  ),
                  suffix: const Padding(
                    padding: EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                    child: Icon(
                      Icons.search,
                      color: AppColors.COLOR_LIGHT_GREEN,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.COLOR_WHITE,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
