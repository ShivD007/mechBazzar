import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mechbazaar/atoms/horizontal_item.dart';
import 'package:mechbazaar/atoms/red_button.dart';
import 'package:mechbazaar/core/constants/string_constants.dart';
import 'package:mechbazaar/core/custom_appbar_with_back_button.dart';
import 'package:mechbazaar/core/custom_spacers.dart';
import 'package:mechbazaar/core/helper_ui.dart';
import 'package:mechbazaar/core/models/product_res_model.dart';
import 'package:mechbazaar/core/text_extension.dart';
import 'package:mechbazaar/modules/cart/controller/cart_controller.dart';
import 'package:mechbazaar/routes/custom_navigator.dart';
import '../../../core/app_colors.dart';
import '../../../routes/app_pages.dart';

class CartView extends StatefulWidget {
  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController controller = Get.find<CartController>();

  @override
  void initState() {
    controller.setUser();
    if (controller.user != null) controller.getCart(isLoading: true, onSuccess: () {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBack(title: cart, isCenterAppicon: true),
      bottomNavigationBar: Obx(
        () => controller.total.value == 0
            ? SizedBox.shrink()
            : Padding(
                padding: EdgeInsets.fromLTRB(22.w, 0, 22.w, 16.h + MediaQuery.of(context).viewInsets.bottom),
                child: RedButton(
                  proceed + " $currency ${controller.total.value}",
                  () => CustomNavigator.pushTo(Routes.placeOrder,
                          arguments: [controller.total.value, controller.totalQty, controller.orderList,null])
                      ?.then((value) => controller.getCart(isLoading: true, onSuccess: () {})),
                  isDisables: controller.total.value == 0 || controller.notValidQuantity.value,
                ),
              ),
      ),
      body: SafeArea(
          child: Obx(() => controller.isListLoading.value
              ? HelperUI.getProgressIndicator()
              : 
              controller.orderList.isEmpty
                  ? Center(
                      child: "No item added to cart!".body16(textColor: AppColors.COLOR_GREY_600))
                  :
              Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        Product item = controller.cartList[index]!;
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: HorizontalItemCard(
                            stock: controller.cartList[index]!.stock,
                            showTap: false,
                            outOfStock: controller.cartList[index]!.stock == 0,
                            onlyFewAvailable: controller.cartList[index]!.stock == null
                                ? false
                                : (controller.cartList[index]!.qty! > controller.cartList[index]!.stock!),
                            onDelete: () {
                              controller.removeCart(() {
                                controller.getCart(onSuccess: () {
                                  HelperUI().hideLoadingDialog();
                                });
                              }, item.id);
                            },
                            onUpdateCart: (val) {
                              if (val == 0) return;
                              controller.addCart(() {
                                controller.getCart(onSuccess: () {
                                  HelperUI().hideLoadingDialog();
                                });
                              }, qty: val, productId: item.id, stock: item.stock);
                            },
                            qty: item.qty,
                            itemName: item.name,
                            imagePath: "https:" + item.photo.toString(),
                            onTap: () {},
                            cPrice: item.price * item.qty!,
                            prevPrice: item.previousPrice * item.qty!,
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
