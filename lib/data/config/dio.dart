import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:partyguam/core/index.dart';

import 'path.dart';

final options = BaseOptions(
  baseUrl: ApiConfigPath.hostUri,
  connectTimeout: const Duration(seconds: 60),
  receiveTimeout: const Duration(seconds: 60),
  responseType: ResponseType.json,
);

/// a singleton class to contain all Dio methods and helper functions
@lazySingleton
class DioClient {
  final Dio _dio;
  CookieJar _cookieJar = CookieJar();

  DioClient() : _dio = Dio(options) {
    _initializeDio();
  }

  Future<void> _initializeDio() async {
    _cookieJar = CookieJar();
    _dio.interceptors.add(CookieManager(_cookieJar));
    await _clearCookiesOnStart();
  }

  Future<void> deleteCookie(Uri uri) async {
    await _cookieJar.delete(uri);
  }

  Future<void> _clearCookiesOnStart() async {
    await _cookieJar.deleteAll();
  }

  /// GET
  Future<Data> get(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode == 200) {
        debugPrint('dio response ${response.data}');

        /// TODO: need to create a response type
        return {'response': response.data};
      }

      throw "something went wrong";
    } catch (e) {
      rethrow;
    }
  }

  ///POST
  Future<Data> post(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('dio response  ${response.data}');
        return response.data;
      }
      throw "something went wrong";
    } catch (e) {
      rethrow;
    }
  }

  /// PUT
  Future<Data> put(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200) {
        debugPrint('dio response  ${response.data}');
        return response.data;
      }
      throw "something went wrong";
    } catch (e) {
      rethrow;
    }
  }

  /// DELETE
  Future<dynamic> delete(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      if (response.statusCode == 204) {
        debugPrint('dio response ${response.data}');
        return response.data;
      }
      throw "something went wrong";
    } catch (e) {
      rethrow;
    }
  }
}
