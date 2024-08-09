import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:weathertask/config/config_base.dart';

import '../../config/global_variable.dart';

class NetworkService {
  final dio = Dio();

  Future<Response> get(
      {required String? url,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters,
      bool isAuth = false,
      String? lang = "ar"}) async {
    // const _token = '';
    final authHeaders = {
      'Authorization': "Bearer $token",
      'Accept': 'application/json',
      'Accept-Language': Intl.getCurrentLocale(),
    };

    headers = {
      'Accept': 'application/json',
      'Accept-Language': Intl.getCurrentLocale(),
    };

    Response? response;
    try {
      dio.options.baseUrl = ConfigBase.baseUrl;
      response = await dio.get(
        url!,
        options: Options(
          headers: isAuth ? authHeaders : headers,
        ),
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response;
      }
      log(e.error.toString(), name: 'dioError');
    }
    return handleResponse(response!);
  }

  Future<Response> post({
    required String? url,
    Map<String, String>? headers,
    body,
    Map<String, dynamic>? queryParameters,
    bool isAuth = false,
    encoding,
  }) async {
    if (kDebugMode) {
      print('body => $body');
    }
    // const _token = '';
    final authHeaders = {
      'Authorization': "Bearer $token",
      'Accept': 'application/json',
      'Accept-Language': Intl.getCurrentLocale(),
    };

    headers = {
      'Accept': 'application/json',
      'Accept-Language': Intl.getCurrentLocale(),
    };

    Response? response;
    dio.options.baseUrl = ConfigBase.baseUrl;
    try {
      response = await dio.post(
        url!,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: isAuth ? authHeaders : headers,
          requestEncoder: encoding,
        ),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse(response!);
  }

  Future<Response> put({
    required String? url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool isAuth = false,
    encoding,
  }) async {
    if (kDebugMode) {
      print('body => $body');
    }
    // const _token = '';
    final authHeaders = {
      'Authorization': "Bearer $token",
      'Accept': 'application/json',
      'Accept-Language': Intl.getCurrentLocale(),
    };

    headers = {
      'Accept': 'application/json',
      'Accept-Language': Intl.getCurrentLocale(),
    };

    Response? response;
    dio.options.baseUrl = ConfigBase.baseUrl;
    try {
      response = await dio.put(
        url!,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: isAuth ? authHeaders : headers,
          requestEncoder: encoding,
        ),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse(response!);
  }

  Future<Response> patch({
    required String? url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool isAuth = false,
    encoding,
  }) async {
    if (kDebugMode) {
      print('body => $body');
    }
    // const _token = '';
    final authHeaders = {
      'Authorization': "Bearer $token",
      'Accept': 'application/json',
      'Accept-Language': Intl.getCurrentLocale(),
    };

    headers = {
      'Accept': 'application/json',
      'Accept-Language': Intl.getCurrentLocale(),
    };

    Response? response;
    dio.options.baseUrl = ConfigBase.baseUrl;
    try {
      response = await dio.patch(
        url!,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: isAuth ? authHeaders : headers,
          requestEncoder: encoding,
        ),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse(response!);
  }

  Future<Response> delete({
    required String? url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool isAuth = false,
    encoding,
  }) async {
    if (kDebugMode) {
      print('body => $body');
    }
    // const _token = '';
    final authHeaders = {
      'Authorization': "Bearer $token",
      'Accept': 'application/json',
      'Accept-Language': Intl.getCurrentLocale(),
    };

    headers = {
      'Accept': 'application/json',
      'Accept-Language': Intl.getCurrentLocale(),
    };

    Response? response;
    dio.options.baseUrl = ConfigBase.baseUrl;
    try {
      response = await dio.delete(
        url!,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: isAuth ? authHeaders : headers,
          requestEncoder: encoding,
        ),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse(response!);
  }

  Future<Response> getWithoutBaseUrl(
      {required String? url,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters,
      bool isAuth = false,
      String? lang = "ar"}) async {
    // const _token = '';
    final authHeaders = {
      'Authorization': "Bearer $token",
      'Accept-Language': Intl.getCurrentLocale(),
    };

    headers = {
      'Accept-Language': Intl.getCurrentLocale(),
    };

    Response? response;
    try {
      dio.options.baseUrl = "";
      response = await dio.get(
        url!,
        options: Options(
          headers: isAuth ? authHeaders : headers,
        ),
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response;
      }
      log(e.error.toString(), name: 'dioError');
    }
    return handleResponse(response!);
  }

  Response handleResponse(Response response) {
    if (kDebugMode) {
      print('response => ${response.data}');
    }
    final int statusCode = response.statusCode ?? 500;
    if (statusCode >= 200 && statusCode < 300) {
      return response;
    } else {
      return response;
    }
  }
}
