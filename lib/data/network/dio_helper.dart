import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constants/end_point.dart';

class DioHelper {
  static late Dio _dio;

  static init() {
    _dio = Dio();
    _dio.options.baseUrl = baseurl;

    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.headers = {
      'Content-Type': 'application/json',
    };
  }

  Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
  }) {
    _dio.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
    };
    return _dio.post(
      url,
      queryParameters: query ?? {},
      data: data,
    );
  }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    _dio.options.headers = {

      'lang': lang,
      'Authorization': token,
    };
    return await _dio.get(
      url,
      queryParameters: query ?? {},
    ).catchError((onError){
      debugPrint('error: ${onError.toString()}');
    });
  }

  Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
  }) async {
    _dio.options.headers = {
      'lang': lang,
      'Authorization': token,
    };
    return await _dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
  }) async {
    _dio.options.headers = {
      'lang': lang,
      'Authorization': token,
    };
    return await _dio.delete(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
