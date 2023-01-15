import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mechBazzar/atoms/red_button.dart';
import 'package:mechBazzar/core/Images/custom_network_image.dart';
import 'package:mechBazzar/core/constants/string_constants.dart';
import 'package:mechBazzar/core/custom_appbar_with_back_button.dart';
import 'package:mechBazzar/core/custom_spacers.dart';
import 'package:mechBazzar/core/text_extension.dart';
import '../../../atoms/currency.dart';
import '../../../atoms/drawer_widget.dart';
import '../../../core/app_colors.dart';
import '../controllers/product_detail_controller.dart';

final GlobalKey<ScaffoldState> home_key = GlobalKey();

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBack(
        title: "Product Details",
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 48.h, width: 180.w, child: RedButton("Add to cart", () {})),
            SizedBox(height: 48.h, width: 180.w, child: RedButton("Buy Now", () {})),
          ],
        ),
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
                      CustomNetworkImageView.square(
                          fit: BoxFit.cover,
                          height: 220.h,
                          width: double.infinity,
                          imagePath: "https:" + controller.product.photo.toString()),
                      CustomSpacers.height10,
                      controller.product.name.toString().h25(fontSize: 18.sp, textAlign: TextAlign.center),
                      CustomSpacers.height10,
                      price.h25(fontSize: 18.sp),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: CurrencyView(
                          currentPrice: controller.product.price.toDouble(),
                          previousPrice: controller.product.previousPrice.toDouble(),
                        ),
                      ),
                      CustomSpacers.height16,
                      sku.h25(fontSize: 18.sp),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child:
                            controller.product.sku.toString().body16(maxLines: 3, textColor: AppColors.COLOR_GREY_900),
                      ),
                      CustomSpacers.height10,
                      Html(
                        data: controller.product.details.toString(),
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
