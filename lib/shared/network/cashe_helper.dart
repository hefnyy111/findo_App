// shared/network/cashe_helper.dart
import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {
  
  static SharedPreferences? sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  
  // ====================== Save data ======================
  static Future<bool> saveData({
    required String key,
    required dynamic value
  }) async {
    if(value is String) return await sharedPreferences!.setString(key, value);
    if(value is int) return await sharedPreferences!.setInt(key, value);
    if(value is double) return await sharedPreferences!.setDouble(key, value);
    if(value is bool) return await sharedPreferences!.setBool(key, value);
    return false;
  }
  // ====================== get Data ======================
  static dynamic getData({
    required String key
  }) {
    return sharedPreferences!.get(key);
  }
  // ====================== remove Data ======================
  static dynamic removeData({
    required String key
  }) {
    return sharedPreferences!.remove(key);
  }

}