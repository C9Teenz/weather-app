import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static Future<bool> setCode(String state) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final res = pref.setString('code', state);
    return res;
  }

  static Future<String> getCode() {
    return SharedPreferences.getInstance().then((pref) {
      return pref.getString('code') ?? '';
    });
  }
}
