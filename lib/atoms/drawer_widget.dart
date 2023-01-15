import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechBazzar/atoms/save_shared_pref.dart';
import 'package:mechBazzar/core/app_colors.dart';
import 'package:mechBazzar/core/custom_spacers.dart';
import 'package:mechBazzar/core/helper_ui.dart';
import 'package:mechBazzar/core/text_extension.dart';
import 'package:mechBazzar/modules/profile/models/users_model.dart';
import 'package:mechBazzar/routes/custom_navigator.dart';

import '../routes/app_pages.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  UserModel? user;
  @override
  void didChangeDependencies() {
    user = UserModel.fromJson(
        json.decode(SavePreferences.getStringPreferences("user")!));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: AppColors.COLOR_GREEN),
              child: GestureDetector(
                onTap: () async {
                  await CustomNavigator.pushTo(Routes.profile);
                  setState(() {
                    user = UserModel.fromJson(json
                        .decode(SavePreferences.getStringPreferences("user")!));
                  });
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.COLOR_WHITE,
                      radius: 25.h,
                      child: Icon(
                        Icons.person,
                        color: AppColors.COLOR_BLACK,
                      ),
                    ),
                    CustomSpacers.width8,
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (user?.name ?? "").h25(
                              maxLines: 1, textColor: AppColors.COLOR_WHITE),
                          CustomSpacers.height12,
                          (user?.email ?? "").body16(
                              maxLines: 1, textColor: AppColors.COLOR_WHITE),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          ListTile(
            title: const Text('Categories'),
            onTap: () {
              CustomNavigator.pop();
              CustomNavigator.pushTo(Routes.category);
            },
          ),
          ListTile(
            title: const Text('Brand List'),
            onTap: () {
              CustomNavigator.pop();
              CustomNavigator.pushTo(Routes.brand);
            },
          ),
          ListTile(
            title: const Text('Order History'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.power_settings_new),
            title: const Text('Logout'),
            onTap: () {
              HelperUI().logout();
            },
          ),
        ],
      ),
    );
  }
}
