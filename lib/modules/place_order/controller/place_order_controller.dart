import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mechBazzar/atoms/save_shared_pref.dart';
import 'package:mechBazzar/core/razorpay_controller.dart';
import 'package:mechBazzar/modules/cart/model/cart_model.dart';
import 'package:mechBazzar/modules/place_order/model/razar_pay_model.dart';
import 'package:mechBazzar/modules/profile/models/users_model.dart';
import '../../../core/helper_ui.dart';
import '../repository/place_order_repo.dart';

class PlaceOrderController extends GetxController with HelperUI {
  late UserModel user;
  late TextEditingController cityController;
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController countryController;
  late TextEditingController zipcodeController;
  late TextEditingController noteController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late num amount;
  late int totalQty;
  late List<Cart> cartList;

  late RazorpayController razorpayController;

  @override
  void onInit() {
    super.onInit();
    amount = Get.arguments[0];
    totalQty = Get.arguments[1];
    cartList = Get.arguments[2];

    user = UserModel.fromJson(json.decode(SavePreferences.getStringPreferences("user")!));

    bool isRegistred = Get.isRegistered<RazorpayController>();
    if (isRegistred) {
      razorpayController = Get.find();
    }
    cityController = TextEditingController();
    nameController = TextEditingController(text: user.name);
    emailController = TextEditingController(text: user.email);
    phoneController = TextEditingController(text: user.phone);
    addressController = TextEditingController(text: user.address);
    countryController = TextEditingController(text: "India");
    zipcodeController = TextEditingController();
    noteController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    cityController.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    countryController.dispose();
    zipcodeController.dispose();
    noteController.dispose();
  }

  Future<void> onSubmit() async {
    showLoadingDialog();
    if (formKey.currentState!.validate()) {
      PlaceOrderRepo.getOrderID(
          amount: amount.toInt(),
          onError: (e) {
            hideLoadingDialog();
            HelperUI().showSnackbar(e.toString());
          },
          onSuccess: (response) async {
            log(response.toString());
            RazarpayOder razarpayOder = RazarpayOder.fromJson(response);

            await razorpayController.proceedWithRazorPay(
              orderId: razarpayOder.data!.id.toString(),
              price: amount.toDouble(),
              description: noteController.text,
              onSuccess: (val) {
                PlaceOrderRepo.placeOrder(
                    userId: user.id!,
                    cartList: cartList,
                    totalQty: totalQty,
                    total: amount,
                    email: emailController.text,
                    name: nameController.text,
                    phone: phoneController.text,
                    address: addressController.text,
                    customerCountry: countryController.text,
                    city: cityController.text,
                    zip: zipcodeController.text,
                    orderNotes: noteController.text,
                    orderNumber: razarpayOder.data!.id.toString(),
                    onError: (e) {
                      hideLoadingDialog();
                      HelperUI().showSnackbar(e.toString());
                    },
                    onSuccess: (response) {
                      hideLoadingDialog();
                    });
              },
            );
          });

      return;
    }
  }
}
