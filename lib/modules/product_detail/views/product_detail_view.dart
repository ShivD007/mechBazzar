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
  final data =
      "<h3  class=\"key_features\">KEY FEATURES</h3><ul class=\"key_features_ul\"><li>Robust & Strong Design</li><li>Durable & Easy to Install</li><li>Corrosion Resistant, Heat Resistant & Impact Resistant</li></ul><h3  class=\"attributes_head\">Product Specifications</h3><table class=\"attributes_class\"><tr><td><b>Series</b></td><td>enGem</td></tr><tr><td><b>Country of origin</b></td><td>India</td></tr><tr><td><b>Number of Modules</b></td><td>2</td></tr><tr><td><b>Warranty</b></td><td>12 Years</td></tr><tr><td><b>Housing Material</b></td><td>FR Grade Virgin Polycarbonate</td></tr><tr><td><b>Voltage</b></td><td>230 V AC</td></tr><tr><td><b>Number of Phases</b></td><td>Single</td></tr><tr><td><b>Current</b></td><td>25 Amp</td></tr><tr><td><b>Breaking Capacity</b></td><td>3 kA</td></tr><tr><td><b>Notes</b></td><td>Images are for Reference Purpose Only</td></tr><tr><td><b>Standards</b></td><td>BIS & IS/IEC 60898 - Part 1</td></tr><tr><td><b>Item Code</b></td><td>CB93202KW25</td></tr></table>";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBack(
        title: "Product 1",
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 48.h,
                width: 180.w,
                child: RedButton("Add to cart", () {})),
            SizedBox(
                height: 48.h, width: 180.w, child: RedButton("Buy Now", () {})),
          ],
        ),
      ),
      body: SingleChildScrollView(
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
                      "https://images.unsplash.com/photo-1671726805768-575f88de945a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60"),
              CustomSpacers.height10,
              "L&T enGem 25A DP Mini MCB, CB93202KW25 (Pack of 5)"
                  .h25(fontSize: 18.sp),
              CustomSpacers.height10,
              price.h25(fontSize: 18.sp),
              Padding(
                padding:  EdgeInsets.only(left: 8.w),
                child: CurrencyView(
                  currentPrice: 25363.677,
                  previousPrice: 4000.098098,
                ),
              ),
              CustomSpacers.height16,
              sku.h25(fontSize: 18.sp),
              Padding(
                padding:  EdgeInsets.only(left: 8.w),
                child: "hgfgfjff#6587565".body16(
                    maxLines: 3,
                    textColor: AppColors.COLOR_GREY_900),
              ),
              CustomSpacers.height10,
              Html(
                data: data,
              ),
              CustomSpacers.height10,
            ],
          ),
        ),
      ),
    );
  }
}
