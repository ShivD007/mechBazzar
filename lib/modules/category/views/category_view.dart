import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mechBazzar/atoms/item_list_view.dart';
import 'package:mechBazzar/core/custom_appbar_with_back_button.dart';
import '../../../atoms/custom_tab_bar_view.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return CustomTabBarView(
      appBar: CustomAppBarWithBack(title: "Categories"),
      controller: controller.tabController,
      length: 3,
      tabs: [
        Tab(
          text: 'qwe',
        ),
        Tab(
          text: 'qwe',
        ),
        Tab(
          text: 'qwe',
        ),
      ],
      children: controller.category
          .map((e) => 
          
          ItemListView(
                topWidget: Text(e),
              ))
          .toList(),
    );
  }
}
