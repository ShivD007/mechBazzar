import 'package:mechBazzar/core/app_colors.dart';
import 'package:mechBazzar/core/custom_input.dart';
import 'package:mechBazzar/modules/home/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../atoms/save_shared_pref.dart';
import '../../../core/constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/custom_navigator.dart';

class SliverCustomAppBar extends StatelessWidget {
  const SliverCustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      title: Text(mechBazzar),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          home_key.currentState?.openDrawer();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
           CustomNavigator.pushTo(Routes.searchScreen);
          },
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart_rounded),
          onPressed: () {
            final String? user = SavePreferences.getStringPreferences("user");
            if (user != null) {
              CustomNavigator.pushTo(Routes.cart);
            } else {
              CustomNavigator.pushTo(Routes.login);
            }
          },
        )
      ],
     
      titleSpacing: 0,
      elevation: 1.0,
      
    );
  }
}
