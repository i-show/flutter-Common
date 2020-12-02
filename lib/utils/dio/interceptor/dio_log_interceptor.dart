import 'dart:developer';

import 'package:dio/dio.dart';

/// DIO 自定义的LogInterceptor
class DioLogInterceptor extends Interceptor {
  static const _REQUEST_ID_KEY = "request_id";
  static const _LOG_TAG = "DioLog";

  DioLogInterceptor(
      {this.request = true,
      this.requestHeader = true,
      this.requestBody = false,
      this.responseHeader = true,
      this.responseBody = false,
      this.error = true,
      this.logPrint = print,
      this.logTag = _LOG_TAG});

  /// Print request [Options]
  bool request;

  /// Print request header [Options.headers]
  bool requestHeader;

  /// Print request data [Options.data]
  bool requestBody;

  /// Print [Response.data]
  bool responseBody;

  /// Print [Response.headers]
  bool responseHeader;

  /// Print error message
  bool error;

  /// Print log Tag
  String logTag;

  ///  Log printer; defaults print log to console.
  void Function(Object object) logPrint;

  @override
  Future onRequest(RequestOptions options) {
    var requestId = _genRequestId();
    var headers = options.headers;
    options.headers[_REQUEST_ID_KEY] = requestId;
    _log("**************** $requestId ****************");
    _log("$requestId ${options.method} ${options.uri}");

    if (requestHeader) {
      String headerStr = "";
      headers.forEach((key, value) {
        if (key != _REQUEST_ID_KEY) {
          if (headerStr.isEmpty) {
            headerStr = "$key:$value";
          } else {
            headerStr = "$headerStr $key:$value";
          }
        }
      });
      if (headerStr.isNotEmpty) _log("$requestId HEADER: $headerStr");
    }

    if (requestBody && options.data != null) {
      _log("$requestId PARAMS: ${options.data}");
    }

    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) async {
    var requestId = response.request.headers[_REQUEST_ID_KEY];
    var contentType = response.headers.value("content-type");
    if(_isPaintText(contentType)) {
      _log("$requestId RESULT: ${response.toString()}");
    } else {
      var length = response.headers.value("content-length");
      _log("$requestId RESULT: type = $contentType, size = $length");
    }
  }

  @override
  Future onError(DioError err) async {
    var requestId = err.request.headers[_REQUEST_ID_KEY];
    if (err.response != null) {
      _log("$requestId FAILED: code:${err.response.statusCode}, info:${err.response.toString()}");
    } else {
      _log("$requestId FAILED: ${err.error}");
    }
  }
  /// 生成一个请求的ID
  String _genRequestId() {
    return DateTime.now().microsecondsSinceEpoch.toString().substring(12);
  }

  void _log(String msg) {
    log(msg, name: _LOG_TAG);
  }

  bool _isPaintText(String contentType) {
    var type = contentType.toLowerCase();
    if(type.contains("text/") || type.contains("application/json")) {
      return true;
    } else {
      return false;
    }
  }
}
