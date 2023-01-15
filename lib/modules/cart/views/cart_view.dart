import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mechBazzar/atoms/horizontal_item.dart';
import 'package:mechBazzar/core/constants/string_constants.dart';
import 'package:mechBazzar/core/custom_appbar_with_back_button.dart';
import 'package:mechBazzar/core/custom_spacers.dart';
import 'package:mechBazzar/core/helper_ui.dart';
import 'package:mechBazzar/core/models/product_res_model.dart';
import 'package:mechBazzar/modules/cart/controller/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBack(title: cart, isCenterAppicon: true),
      body: SafeArea(
          child: Obx(() => controller.isListLoading.value
              ? HelperUI.getProgressIndicator()
              : Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: ListView.separated(
                      itemBuilder: (_, index) {
                        Product item = controller.cartList[index]!;
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: HorizontalItemCard(
                            showTap: false,
                            onDelete: () {
                              controller.removeCart(() {
                                controller.getCart();
                              }, item.id);
                            },
                            onUpdateCart: (val) {
                              print(val);
                              controller.addCart(() {
                                controller.getCart();
                              }, qty: val, productId: item.id);
                            },
                            qty: item.qty,
                            itemName: item.name ?? "",
                            imagePath: "https:" + item.photo.toString(),
                            onTap: () {},
                          ),
                        );
                      },
                      separatorBuilder: (_, context) {
                        return CustomSpacers.height8;
                      },
                      itemCount: controller.cartList.length),
                ))),
    );
  }
}
