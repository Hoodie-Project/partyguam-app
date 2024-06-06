import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:partyguam/main.dart';

class CookieManager extends Interceptor {
  static final CookieManager _instance = CookieManager._internal();

  static CookieManager get instance => _instance;

  CookieManager._internal();

  String? _cookie;

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (response.statusCode == 200) {
      if (response.headers.map['set-cookie'] != null) {
        _saveCookie(response.headers.map['set-cookie']![0]);
      }
    } else if (response.statusCode == 401) {
      _clearCookie();
    }

    super.onResponse(response, handler);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    debugPrint('current cookie $_cookie');

    options.headers['Cookie'] = _cookie;
    return super.onRequest(options, handler);
  }

  Future<void> initCookie() async {
    _cookie = localStorage.getString('cookie');
  }

  void _saveCookie(String newCookie) {
    if (_cookie != newCookie) {
      _cookie = newCookie;
      localStorage.setString('cookie', _cookie!);
    }
  }

  void _clearCookie() async {
    _cookie = null;
    localStorage.remove('cookie');
  }
}
