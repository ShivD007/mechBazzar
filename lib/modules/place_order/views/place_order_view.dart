import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mechbazaar/atoms/horizontal_item.dart';
import 'package:mechbazaar/atoms/red_button.dart';
import 'package:mechbazaar/core/app_colors.dart';
import 'package:mechbazaar/core/constants/string_constants.dart';
import 'package:mechbazaar/core/custom_appbar_with_back_button.dart';
import 'package:mechbazaar/core/custom_spacers.dart';
import 'package:mechbazaar/modules/place_order/controller/place_order_controller.dart';
import '../../../core/custom_input.dart';

class PlaceOrderView extends GetView<PlaceOrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarWithBack(
          title: deliveryDetails,
          isCenterAppicon: true,
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(22.w, 0, 22.w, 16.h + MediaQuery.of(context).viewInsets.bottom),
          child: RedButton(payment, () => controller.onSubmit()),
        ),
        body: SafeArea(
            child: Form(
          key: controller.formKey,
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.h,
              ),
              child: SingleChildScrollView(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomSpacers.height16,
                  if (controller.product != null) ...[
                    HorizontalItemCard(
                      stock: controller.product!.stock,
                      showTap: false,
                      outOfStock: controller.product!.stock == 0,
                      onlyFewAvailable: controller.product!.stock == null
                          ? false
                          : (controller.product!.qty! > controller.product!.stock!),
                      qty: controller.product!.qty,
                      itemName: controller.product!.name,
                      imagePath: "https:" + controller.product!.photo.toString(),
                      onTap: () {},
                      cPrice: controller.product!.price * controller.product!.qty!,
                      prevPrice: controller.product!.previousPrice * controller.product!.qty!,
                    ),
                    CustomSpacers.height16,
                  ],
                  CustomInput(
                    controller: controller.nameController,
                    prefixIcon: Icon(Icons.person),
                    placeholder: name,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))],
                    validator: (val) {
                      if (val!.isEmpty) {
                        return enterYourName;
                      }
                      return null;
                    },
                  ),
                  CustomSpacers.height12,
                  CustomInput(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(Icons.email),
                    placeholder: email,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return enterEmail;
                      }
                      return null;
                    },
                  ),
                  CustomSpacers.height12,
                  CustomInput(
                    prefixIcon: Icon(Icons.phone),
                    placeholder: mobileNumber,
                    maxLength: 10,
                    controller: controller.phoneController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (val) {
                      if (val!.isEmpty || val.length < 10) {
                        return entertenDigitMobileNumber;
                      }
                      return null;
                    },
                  ),
                  CustomSpacers.height12,
                  CustomInput(
                    prefixIcon: Icon(Icons.maps_home_work),
                    placeholder: address,
                    minLine: 1,
                    maxLines: 4,
                    maxLength: 200,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return enterAddress;
                      }
                      return null;
                    },
                    controller: controller.addressController,
                  ),
                  CustomSpacers.height12,
                  CustomInput(
                    controller: controller.countryController,
                    prefixIcon: Icon(Icons.flag),
                    isReadOnly: true,
                    placeholder: country,
                  ),
                  CustomSpacers.height12,
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    Expanded(
                      child: CustomInput(
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))],
                        controller: controller.cityController,
                        prefixIcon: Icon(Icons.location_city),
                        placeholder: city,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return enterCity;
                          }
                          return null;
                        },
                      ),
                    ),
                    CustomSpacers.width8,
                    Expanded(
                      child: CustomInput(
                        controller: controller.zipcodeController,
                        prefixIcon: Icon(Icons.point_of_sale),
                        placeholder: zipcode,
                        maxLength: 6,
                        validator: (val) {
                          if (val!.isEmpty || val.length < 6) {
                            return enterValidZipcode;
                          }

                          return null;
                        },
                      ),
                    ),
                  ]),
                  CustomSpacers.height12,
                  CustomInput(
                    controller: controller.noteController,
                    prefixIcon: Icon(Icons.note),
                    placeholder: orderNote,
                  ),
                  CustomSpacers.height8,
                ],
              ))),
        )));
  }
}
