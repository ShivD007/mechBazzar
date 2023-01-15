import '../../../core/constants/url_constants.dart';
import '../../../network/api_base_helper.dart';

class HomeRepo {
  static Future getHomeList({required Function(String) onError, required Function(dynamic) onSuccess}) async {
    try {
      final response = await BaseApiCallHelper.post(AppUrls.getHomepageList, {});
      onSuccess(response);
    } catch (e) {
      print(e);
      onError(e.toString());
    }
  }
}
