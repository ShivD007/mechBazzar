import 'dart:convert';

import 'package:mechBazzar/core/constants/string_constants.dart';
import 'package:mechBazzar/modules/cart/model/cart_model.dart';
import 'package:mechBazzar/modules/profile/models/users_model.dart';

import '../../../atoms/save_shared_pref.dart';
import '../../../core/constants/url_constants.dart';
import '../../../network/api_base_helper.dart';

class PlaceOrderRepo {
  static Future getOrderID(
      {required num amount, required Function(String) onError, required Function(dynamic) onSuccess}) async {
    UserModel userModel = UserModel.fromJson(jsonDecode(SavePreferences.getStringPreferences("user")!));

    var body = {
      'user_id': userModel.id,
      'amount': amount,
    };
    try {
      final response = await BaseApiCallHelper.post(AppUrls.getOrderID, body);
      onSuccess(response);
    } catch (e) {
      print(e);
      onError(e.toString());
    }
  }

  static Future placeOrder(
      {required int userId,
      required String cartList,
      required int totalQty,
      required num total,
      required String email,
      required String name,
      required String phone,
      required String address,
      required String customerCountry,
      required String city,
      required String zip,
      required String orderNotes,
      required String orderNumber,
      required Function(String) onError,
      required Function(dynamic) onSuccess}) async {
    var body = {
      'user_id': userId,
      'cart': cartList,
      'totalQty': totalQty,
      'total': total,
      'email': email,
      'name': name,
      'phone': phone,
      'address': address,
      'customer_country': customerCountry,
      'city': city,
      'zip': zip,
      'order_notes': orderNote,
      'order_number': orderNumber,
    };

    try {
      final response = await BaseApiCallHelper.post(AppUrls.placeOrder, body);
      onSuccess(response);
    } catch (e) {
      print(e);
      onError(e.toString());
    }
  }
}
