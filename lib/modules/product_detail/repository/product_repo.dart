import '../../../core/constants/url_constants.dart';
import '../../../network/api_base_helper.dart';

class ProductDetailRepo {
  static Future getProductDetails(
      {required int productId, required Function(String) onError, required Function(dynamic) onSuccess}) async {
    var body = {
      'product_id': productId,
    };
    try {
      final response = await BaseApiCallHelper.post(AppUrls.getProductDetail, body);
      onSuccess(response);
    } catch (e) {
      print(e);
      onError(e.toString());
    }
  }
}
