import 'dart:developer';

import '../../../core/constants/url_constants.dart';
import '../../../network/api_base_helper.dart';

class CategoryRepo {
  static getShopCategory({required Function(String) onError, required Function(dynamic) onSuccess}) async {
    try {
      final response = await BaseApiCallHelper.get(AppUrls.getShopCategory);
      onSuccess(response);
    } catch (e) {
      print(e);
      onError(e.toString());
    }
  }

  static getShopSubCategory(
      {required int categoryId, required Function(String) onError, required Function(dynamic) onSuccess}) async {
    var body = {'category_id': categoryId};

    try {
      final response = await BaseApiCallHelper.post(AppUrls.getShopSubCategory, body);
      onSuccess(response);
    } catch (e) {
      print(e);
      onError(e.toString());
    }
  }

  static getProductList(
      {required int categoryId,
      required int subcategoryId,
      required int page,
      required int sortBy,
      required Function(String) onError,
      required Function(dynamic) onSuccess}) async {
    var body = {'category_id': categoryId, 'subcategory_id': subcategoryId, 'page': page, 'sortBy': sortBy};

    try {
      final response = await BaseApiCallHelper.post(AppUrls.getProductList, body);
      onSuccess(response);
    } catch (e) {
      print(e);
      onError(e.toString());
    }
  }
}
