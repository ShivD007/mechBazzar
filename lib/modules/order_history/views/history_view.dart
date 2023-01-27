import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mechBazzar/atoms/horizontal_item.dart';
import 'package:mechBazzar/core/app_colors.dart';
import 'package:mechBazzar/core/custom_appbar_with_back_button.dart';
import 'package:mechBazzar/core/custom_spacers.dart';
import 'package:mechBazzar/core/helper_ui.dart';
import 'package:mechBazzar/core/models/product_res_model.dart';
import 'package:mechBazzar/core/text_extension.dart';
import 'package:mechBazzar/modules/order_history/controller/history_controller.dart';
import 'package:mechBazzar/modules/order_history/order_model.dart';

import '../../../core/constants/value_constants.dart';
import '../../../core/custom_card.dart';

class HistoryView extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBarWithBack(title: "Order History", isCenterAppicon: true),
      body: SafeArea(
          child: Obx(() => controller.isListLoading.value
              ? HelperUI.getProgressIndicator()
              : controller.orderList.isEmpty
                  ? Center(
                      child: "No order".body16(
                          fontSize: 24, textColor: AppColors.COLOR_GREY_600))
                  : Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            OrderData item = controller.orderList[index]!;
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: CustomCard(
                                verticalPadding: 0,
                                horizontalPadding: 0,
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                      dividerColor: Colors.transparent),
                                  child: ExpansionTile(
                                    title: ("Order Id: " + item.orderNumber!)
                                        .h25(
                                            fontSize: 16,
                                            textAlign: TextAlign.start),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomSpacers.height10,
                                        Row(
                                          children: [
                                            "Order Status: ".body16(
                                                fontSize: 14,
                                                textAlign: TextAlign.start),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
                                              decoration: BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius:  BorderRadius.circular(6.r)),
                                              child: item.status!.body16(
                                                  fontSize: 14,
                                                  textColor:
                                                      AppColors.COLOR_WHITE,
                                                  textAlign: TextAlign.start),
                                            ),
                                          ],
                                        ),
                                        CustomSpacers.height10,
                                        "${item.currencySign} ${item.payAmount}"
                                            .h25(
                                                fontSize: 14,
                                                textAlign: TextAlign.start),
                                      ],
                                    ),
                                    children: item.cart!
                                        .map((item) => Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 6.h),
                                          child: HorizontalItemCard(
                                                showTap: false,
                                                outOfStock: false,
                                                qty: item.qty,
                                                itemName: item.productName ?? "",
                                                imagePath: "https:" +
                                                    item.productImage.toString(),
                                                onTap: () {},
                                                cPrice: item.price,
                                                prevPrice: null,
                                                stock: null,
                                              ),
                                        ))
                                        .toList(),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (_, context) {
                            return CustomSpacers.height8;
                          },
                          itemCount: controller.orderList.length),
                    ))),
    );
  }
}
