import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mechBazzar/atoms/custom_carousel.dart';
import 'package:mechBazzar/atoms/red_button.dart';
import 'package:mechBazzar/core/Images/custom_network_image.dart';
import 'package:mechBazzar/core/constants/string_constants.dart';
import 'package:mechBazzar/core/custom_appbar_with_back_button.dart';
import 'package:mechBazzar/core/custom_spacers.dart';
import 'package:mechBazzar/core/helper_ui.dart';
import 'package:mechBazzar/core/text_extension.dart';
import 'package:mechBazzar/modules/cart/controller/cart_controller.dart';
import 'package:mechBazzar/modules/cart/model/cart_model.dart';
import '../../../atoms/currency.dart';
import '../../../atoms/save_shared_pref.dart';
import '../../../core/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/custom_navigator.dart';
import '../controllers/product_detail_controller.dart';

final GlobalKey<ScaffoldState> home_key = GlobalKey();

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBack(
          title: "",
          actionWidget: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.shopping_cart_rounded,
              color: AppColors.COLOR_GREEN,
            ),
            onPressed: () {
              final String? user = SavePreferences.getStringPreferences("user");
              if (user != null) {
                CustomNavigator.pushTo(Routes.cart);
              } else {
                CustomNavigator.pushTo(Routes.login);
              }
            },
          )),
      bottomNavigationBar: Obx(
        () => controller.isInitialLoading.isTrue
            ? SizedBox.shrink()
            : Padding(
                padding: EdgeInsets.fromLTRB(22.w, 0, 22.w,
                    16.h + MediaQuery.of(context).viewInsets.bottom),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (controller.product?.stock != 0) ...[
                      SizedBox(
                        width: 180.w,
                        child: _quiCkBuy(),
                      ),
                      CustomSpacers.width8
                    ],
                    SizedBox(
                      width: 180.w,
                      child: _addToCart(),
                    ),
                  ],
                )),
      ),
      body: Obx(
        () => controller.isInitialLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSpacers.height12,
                      _crouselWidget(controller.product!.gallery ?? [],
                          controller.product!.photo),
                      CustomSpacers.height10,
                      controller.product!.name
                          .toString()
                          .h25(fontSize: 18.sp, textAlign: TextAlign.center),
                      CustomSpacers.height10,
                      price.h25(fontSize: 18.sp),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: CurrencyView(
                          currentPrice: controller.product!.price.toDouble(),
                          previousPrice:
                              controller.product!.previousPrice.toDouble(),
                        ),
                      ),
                      CustomSpacers.height16,
                      sku.h25(fontSize: 18.sp),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: controller.product!.sku.toString().body16(
                            maxLines: 3, textColor: AppColors.COLOR_GREY_900),
                      ),
                      CustomSpacers.height10,
                      Html(
                        data: controller.product!.details.toString(),
                      ),
                      CustomSpacers.height10,
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  RedButton _addToCart() {
    return RedButton(
        controller.product?.stock == 0 ? "Out of stock" : "Add to cart", () {
      final String? user = SavePreferences.getStringPreferences("user");
      if (user != null) {
        Get.find<CartController>().addCart(() {
          HelperUI().showSnackbar("Successfully added to Cart", false);
          HelperUI().hideLoadingDialog();
        },
            qty: 1,
            productId: controller.productId,
            stock: controller.product!.stock);
      } else {
        CustomNavigator.pushTo(Routes.login);
      }
    }, isDisables: controller.product?.stock == 0);
  }

  RedButton _quiCkBuy() {
    List<Map<String, dynamic>> orderList = [];

    orderList.add(Cart.fromJson(controller.product!.toJson()).toJson());

    return RedButton("Quick Buy", () {
      final String? user = SavePreferences.getStringPreferences("user");
      if (user != null) {
        CustomNavigator.pushTo(Routes.placeOrder,
            arguments: [controller.product!.price * 1, 1, orderList,controller.product!]);
      } else {
        CustomNavigator.pushTo(Routes.login);
      }
    }, isDisables: controller.product?.stock == 0);
  }

  Widget _crouselWidget(List<String?> gallery, String imagePath) {
    return CustomCarousel(
        height: 180.h,
        autoPlay: false,
        enabledIndicatorRadius: 10.w,
        disabledIndicatorRadius: 6.w,
        showBottomIndicator: true,
        spaceBeforeIndicator: 5.h,
        widgetList: gallery.isEmpty
            ? <Widget>[
                CustomNetworkImageView.square(
                    fit: BoxFit.cover,
                    height: 220.h,
                    width: double.infinity,
                    imagePath: "https:" + imagePath),
              ]
            : gallery
                .map(
                  (e) => CustomNetworkImageView.square(
                      fit: BoxFit.cover,
                      height: 220.h,
                      width: double.infinity,
                      imagePath: "https:" + e!),
                )
                .toList());
  }
}
