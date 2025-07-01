import 'dart:io';

import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://attendencewebsite.somee.com/api/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String methodUrl,
    Map<String, dynamic>? query,
    String lang = "en",
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      "lang": lang,
      "Authorization": token,
    };
    return await dio.get(
      methodUrl,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String methodUrl,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = "en",
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      "lang": lang,
      "Authorization": token ?? "",
    };
    return await dio.post(
      methodUrl,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> uploadFile({
    required String methodUrl,
    required File file,
  }) async {
    try {
      String fileName = file.path.split('/').last;
      MultipartFile multipartFile =
          await MultipartFile.fromFile(file.path, filename: fileName);
      FormData formData = FormData.fromMap({
        "file": multipartFile,
      });

      var response = await dio.post(methodUrl, data: formData);
      print("${response.statusCode} ${response.data}");
      return response;
    } catch (e) {
      print("File upload failed: $e");
      throw Exception("File upload failed: $e");
    }
  }

  static Future<Response> putData({
    required String methodUrl,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = "en",
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      "lang": lang,
      "Authorization": token ?? "",
    };
    return await dio.put(
      methodUrl,
      queryParameters: query,
      data: data,
    );
  }
}
