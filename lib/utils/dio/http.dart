import 'dart:convert';

import 'package:common/entries/http/api_response.dart';
import 'package:common/entries/http/http_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'Interceptor/app_interceptor.dart';


var http = Http();

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

class Http {
  Dio _dio;

  void init() {
    var options = BaseOptions();
    options.baseUrl = "https://api.adunpai.com/";
    options.sendTimeout = 5000;
    _dio = Dio(options);
    _dio.interceptors.add(LogInterceptor());
    _dio.interceptors.add(AppInterceptor());
    // 后台进行Json解析，增加画面流畅性
    (_dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
  }

  /// Get 请求
  Future<ApiResponse<T>> get<T>(
    String path, {
    Map<String, dynamic> params,
    Options options,
    CancelToken token,
    ProgressCallback progress,
  }) async {
    try {
      Response response =
          await _dio.get(path, queryParameters: params, options: options, cancelToken: token, onReceiveProgress: progress);

      var res = ApiResponse<T>.fromJson(response.data);
      return Future.value(res);
    } on DioError catch (e) {
      return Future.value(parseError(e));
    }
  }

  /// 重新封装后的Post请求
  Future<ApiResponse<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic> params,
    Options options,
    CancelToken token,
    ProgressCallback sendProgress,
    ProgressCallback receiveProgress,
  }) async {
    try {
      Response response = await _dio.post(path,
          data: data,
          queryParameters: params,
          options: options,
          cancelToken: token,
          onSendProgress: sendProgress,
          onReceiveProgress: receiveProgress);

      var res = ApiResponse<T>.fromJson(response.data);
      return Future.value(res);
    } on DioError catch (e) {
      return Future.value(parseError(e));
    }
  }

  /// Post 请求
  Future<ApiResponse<T>> put<T>(
    String path, {
    data,
    Map<String, dynamic> params,
    Options options,
    CancelToken token,
    ProgressCallback sendProgress,
    ProgressCallback receiveProgress,
  }) async {
    try {
      Response response = await _dio.put(path,
          data: data,
          queryParameters: params,
          options: options,
          cancelToken: token,
          onSendProgress: sendProgress,
          onReceiveProgress: receiveProgress);

      var res = ApiResponse<T>.fromJson(response.data);
      return Future.value(res);
    } on DioError catch (e) {
      return Future.value(parseError(e));
    }
  }

  /// Delete 请求
  Future<ApiResponse<T>> delete<T>(String path,
      {data, Map<String, dynamic> params, Options options, CancelToken token}) async {
    try {
      Response response = await _dio.delete(path, data: data, queryParameters: params, options: options, cancelToken: token);
      var res = ApiResponse<T>.fromJson(response.data);
      return Future.value(res);
    } on DioError catch (e) {
      return Future.value(parseError(e));
    }
  }

  /// 解析错误内容
  static ApiResponse<T> parseError<T>(DioError error) {
    var err = error.error;
    if (err is HttpError) {
      var res = ApiResponse<T>();
      res.code = err.code;
      res.message = err.msg;
      return res;
    }

    var res = ApiResponse<T>();
    res.code = -996;
    res.message = "未知错误";
    return res;
  }
}
