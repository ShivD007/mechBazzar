import 'dart:convert';
import 'dart:developer';

import 'package:mechBazzar/core/helper_ui.dart';
import 'package:mechBazzar/modules/profile/models/users_model.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:get/get.dart';

import '../atoms/save_shared_pref.dart';

class RazorpayController extends GetxController with HelperUI {
  RxBool isButtonDisable = false.obs;
  Razorpay? _razorpay;
  late Function(String orderId) onSuccess;
  late UserModel userModel;

  @override
  void onInit() {
    super.onInit();
    userModel = UserModel.fromJson(
        json.decode(SavePreferences.getStringPreferences("user")!));
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
    onSuccess(response.orderId.toString());
    log(response.toString());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    hideLoadingDialog();
    HelperUI().showSnackbar(
        jsonDecode(response.message.toString())["description"] == null
            ? jsonDecode(response.message.toString())["error"]["description"]
            : jsonDecode(response.message.toString())["description"]);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  Future proceedWithRazorPay({
    required double price,
    required String description,
    required String orderId,
    required Function(dynamic) onSuccess,
  }) async {
    this.onSuccess = onSuccess;
    try {
      _razorpay?.open({
        "timeout": 600,
        'key': "rzp_live_xQa6xbbhh6mxa7",
        'amount': (price * 100).toPrecision(2),
        'name': 'MechBazaar',
        "currency": "INR",
        "theme.color": "#4CAF1B",
        'order_id': orderId,
        'description': description,
        'prefill': {
          'contact': userModel.phone ?? "",
          'email': userModel.email ?? "",
          "name": userModel.name ?? ""
        }
      });
    } catch (e) {
      hideLoadingDialog();
      log(e.toString());
    }
  }
}
