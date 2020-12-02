class HttpError {
  int code;
  String msg;


  static HttpError timeOut() {
    var error = HttpError();
    error.code = -100;
    error.msg = "服务器连接超时，请检查网络后再试";
    return error;
  }

  static HttpError cancel() {
    var error = HttpError();
    error.code = -101;
    error.msg = "网络请求已被取消";
    return error;
  }

  static HttpError defaultError() {
    var error = HttpError();
    error.code = -102;
    error.msg = "服务器连接失败，请稍后重试";
    return error;
  }
}
