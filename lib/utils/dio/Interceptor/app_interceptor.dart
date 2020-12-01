import 'package:app/entries/http/api_response.dart';
import 'package:app/entries/http/http_error.dart';
import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    int code = response.data[ApiResponseKey.KEY_CODE];
    String msg = response.data[ApiResponseKey.KEY_MESSAGE];
    if (code != 200) {
      var error = HttpError();
      error.code = code;
      error.msg = msg;
      throw DioError(error: error);
    }
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    return super.onError(_parseError(err));
  }

  /// 解析错误的error信息
  DioError _parseError(DioError dioError) {
    var err = dioError.error;
    // 如果是已经处理后的error 则直接进行返回
    if (err is HttpError) {
      return dioError;
    }
    switch (dioError.type) {
      case DioErrorType.CONNECT_TIMEOUT:
      case DioErrorType.RECEIVE_TIMEOUT:
      case DioErrorType.SEND_TIMEOUT:
        dioError.error = HttpError.timeOut();
        break;
      case DioErrorType.CANCEL:
        dioError.error = HttpError.cancel();
        break;
      case DioErrorType.RESPONSE:
      case DioErrorType.DEFAULT:
        dioError.error = HttpError.defaultError();
        break;
    }

    return dioError;
  }
}
