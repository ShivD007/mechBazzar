import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mechbazaar/atoms/save_shared_pref.dart';
import 'package:mechbazaar/core/models/product_res_model.dart';
import 'package:mechbazaar/core/razorpay_controller.dart';
import 'package:mechbazaar/modules/place_order/model/razar_pay_model.dart';
import 'package:mechbazaar/modules/profile/models/users_model.dart';
import 'package:mechbazaar/routes/custom_navigator.dart';
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
  late List<Map<String, dynamic>> cartList;
  Product? product;

  late RazorpayController razorpayController;

  @override
  void onInit() {
    super.onInit();
    amount = Get.arguments[0];
    totalQty = Get.arguments[1];
    cartList = Get.arguments[2];
    product = Get.arguments[3];
    product?.qty=1;

    user = UserModel.fromJson(
        json.decode(SavePreferences.getStringPreferences("user")!));

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
    if (formKey.currentState!.validate()) {
      showLoadingDialog();

      PlaceOrderRepo.getOrderID(
          amount: (amount * 100).toInt(),
          onError: (e) {
            hideLoadingDialog();
            HelperUI().showSnackbar(e.toString());
          },
          onSuccess: (response) async {
            RazarpayOder razarpayOder = RazarpayOder.fromJson(response);

            await razorpayController.proceedWithRazorPay(
              orderId: razarpayOder.data!.id.toString(),
              price: amount.toDouble(),
              description: noteController.text,
              onSuccess: (orderId) {
                PlaceOrderRepo.placeOrder(
                    userId: user.id!,
                    cartList: jsonEncode(cartList),
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
                    orderNumber: orderId,
                    onError: (e) {
                      hideLoadingDialog();
                      HelperUI().showSnackbar(e.toString());
                    },
                    onSuccess: (response) {
                      hideLoadingDialog();
                      CustomNavigator.pop();
                      HelperUI()
                          .showSnackbar("Successfully order placed!", false);
                    });
              },
            );
          });

      return;
    }
  }
}
