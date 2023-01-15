import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mechBazzar/atoms/red_button.dart';
import 'package:mechBazzar/core/Images/custom_network_image.dart';
import 'package:mechBazzar/core/constants/string_constants.dart';
import 'package:mechBazzar/core/custom_appbar_with_back_button.dart';
import 'package:mechBazzar/core/custom_spacers.dart';
import 'package:mechBazzar/core/helper_ui.dart';
import 'package:mechBazzar/core/text_extension.dart';
import 'package:mechBazzar/modules/cart/controller/cart_controller.dart';
import '../../../atoms/currency.dart';
import '../../../atoms/drawer_widget.dart';
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
          title: "Product Details",
          actionWidget: IconButton(
            icon: const Icon(
              Icons.shopping_cart_rounded,
              color: AppColors.COLOR_BLACK,
            ),
            onPressed: () {
              CustomNavigator.pushTo(Routes.cart);
            },
          )),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(
              22.w, 0, 22.w, 16.h + MediaQuery.of(context).viewInsets.bottom),
          child: RedButton(
              controller.product?.stock == 0 ? "Out of stock" : "Add to cart",
              () {
            Get.find<CartController>().addCart(() {
              HelperUI().showSnackbar("Successfully added to Cart", false);
              HelperUI().hideLoadingDialog();
            }, qty: 1, productId: controller.productId);
          }, isDisables: controller.product?.stock == 0)),
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
                      CustomNetworkImageView.square(
                          fit: BoxFit.cover,
                          height: 220.h,
                          width: double.infinity,
                          imagePath:
                              "https:" + controller.product!.photo.toString()),
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
}
