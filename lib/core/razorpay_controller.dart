import 'dart:convert';
import 'dart:developer';

import 'package:mechBazzar/modules/profile/models/users_model.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:get/get.dart';

import '../atoms/save_shared_pref.dart';

class RazorpayController extends GetxController {
  RxBool isButtonDisable = false.obs;
  Razorpay? _razorpay;
  Function(dynamic reqModel)? onSuccess;
  late UserModel userModel;

  @override
  void onInit() {
    super.onInit();
    userModel = UserModel.fromJson(json.decode(SavePreferences.getStringPreferences("user")!));
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _razorpay?.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    log(response.toString());
  }

  void _handlePaymentError(PaymentFailureResponse response) {}

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  Future proceedWithRazorPay({
    required double price,
    required String description,
    required Function(dynamic) onSuccess,
  }) async {
    this.onSuccess = onSuccess;
    try {
      _razorpay?.open({
        "timeout": 600,
        'key': "rzp_test_Rx50e7yZDiFWFU",
        'amount': (price * 100).toPrecision(2),
        'name': 'MechBazaar',
        "currency": "INR",
        "theme.color": "#4CAF1B",
        'description': description,
        'prefill': {'contact': userModel.phone ?? "", 'email': userModel.email ?? "", "name": userModel.name ?? ""}
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
