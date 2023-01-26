import 'dart:convert';

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
      {required int brandId,
      required int page,
      required Function(String) onError,
      required Function(dynamic) onSuccess}) async {
    var body = {
      'brand_id': brandId,
      'page': page,
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
