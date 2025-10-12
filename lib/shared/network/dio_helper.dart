// shared/network/dio_helper.dart
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    BaseOptions(
      baseUrl: '',
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
      headers: {
         "Content-Type": "application/json",
      },
    );

  }
  
  // ====================== Get Data ======================
  static Future<Response> getData({
    required String url,
    Map<String , dynamic>? query
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
  // ====================== Post Data ======================
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data
  }) async {
    dio?.options.headers = {
     'Content-Type': 'application/json',
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: data
    );
  }
  // ====================== Del Data ======================
  static Future<Response> deleteData({
    required String url,
    required Map<String, dynamic> data
  }) async {
    return await dio!.delete(url, data: data);
  }
}