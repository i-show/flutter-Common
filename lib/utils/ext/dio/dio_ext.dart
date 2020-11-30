import 'package:common/entries/http/api_response.dart';
import 'package:common/entries/http/http_error.dart';
import 'package:dio/dio.dart';

extension DioExt on Dio {
  /// 扩展Get请求
  Future<ApiResponse<T>> requestGet<T>(
    String path, {
    Map<String, dynamic> params,
    Options options,
    CancelToken token,
    ProgressCallback progress,
  }) async {
    try {
      Response response =
          await get(path, queryParameters: params, options: options, cancelToken: token, onReceiveProgress: progress);

      var res = ApiResponse<T>.fromJson(response.data);
      return Future.value(res);
    } on DioError catch (e) {
      return Future.value(_parseError(e));
    }
  }

  /// 扩展Post请求
  Future<ApiResponse<T>> requestPost<T>(
    String path, {
    data,
    Map<String, dynamic> params,
    Options options,
    CancelToken token,
    ProgressCallback sendProgress,
    ProgressCallback receiveProgress,
  }) async {
    try {
      Response response = await post(path,
          data: data,
          queryParameters: params,
          options: options,
          cancelToken: token,
          onSendProgress: sendProgress,
          onReceiveProgress: receiveProgress);

      var res = ApiResponse<T>.fromJson(response.data);
      return Future.value(res);
    } on DioError catch (e) {
      return Future.value(_parseError(e));
    }
  }

  /// 扩展PUT请求
  Future<ApiResponse<T>> requestPut<T>(
    String path, {
    data,
    Map<String, dynamic> params,
    Options options,
    CancelToken token,
    ProgressCallback sendProgress,
    ProgressCallback receiveProgress,
  }) async {
    try {
      Response response = await put(path,
          data: data,
          queryParameters: params,
          options: options,
          cancelToken: token,
          onSendProgress: sendProgress,
          onReceiveProgress: receiveProgress);

      var res = ApiResponse<T>.fromJson(response.data);
      return Future.value(res);
    } on DioError catch (e) {
      return Future.value(_parseError(e));
    }
  }

  /// 扩展Delete请求
  Future<ApiResponse<T>> requestDelete<T>(String path,
      {data, Map<String, dynamic> params, Options options, CancelToken token}) async {
    try {
      Response response = await delete(path, data: data, queryParameters: params, options: options, cancelToken: token);
      var res = ApiResponse<T>.fromJson(response.data);
      return Future.value(res);
    } on DioError catch (e) {
      return Future.value(_parseError(e));
    }
  }

  /// 解析错误内容
  ApiResponse<T> _parseError<T>(DioError error) {
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
