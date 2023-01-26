import '../../../core/constants/url_constants.dart';
import '../../../network/api_base_helper.dart';

class SearchRepo {
  static Future getProductList(
      {required String search,
      required int page,
      required Function(String) onError,
      required Function(dynamic) onSuccess}) async {
    var body = {
      'search': search,
      'page': page,
    };

    try {
      final response = await BaseApiCallHelper.post(AppUrls.searchProduct, body);
      onSuccess(response);
    } catch (e) {
      print(e);
      onError(e.toString());
    }
  }
}
