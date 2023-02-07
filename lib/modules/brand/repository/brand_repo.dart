import '../../../core/constants/url_constants.dart';
import '../../../network/api_base_helper.dart';

class BrandRepo {
  static Future getBrands({required Function(String) onError, required Function(dynamic) onSuccess}) async {
    try {
      final response = await BaseApiCallHelper.post(AppUrls.getBrandList, {});
      onSuccess(response);
    } catch (e) {
      print(e);
      onError(e.toString());
    }
  }

  static Future getProductList(
      {required int brandId,
      required int page,
      required Function(String) onError,
      required Function(dynamic) onSuccess}) async {
    var body = {
      'brand_id': brandId,
      'page': page,
    };

    try {
      final response = await BaseApiCallHelper.post(AppUrls.brandProduct, body);
      onSuccess(response);
    } catch (e) {
      print(e);
      onError(e.toString());
    }
  }
}
