import 'package:get_storage/get_storage.dart';

class SharedPreferenceUtils {
  GetStorage? prefs;

  SharedPreferenceUtils() {
    _init();
  }

  _init() {
    prefs = GetStorage();
  }

  Future<int> getInt(String? strKey) async {
    try {
      int nValue = 0;
      if (strKey != null) {
        nValue = prefs!.read<int>(strKey) ?? 0;
      }
      return nValue;
    } catch (error, stackTrace) {
      return 0;
    }
  }

  void setInt(String? strKey, int nValue) async {
    try {
      if (strKey != null) {
        prefs!.write(strKey, nValue);
      }
    } catch (error, stackTrace) {}
  }
}
