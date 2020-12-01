import 'package:app/generated/json/base/json_convert_content.dart';

class ApiResponse<T> {
  T data;
  int code;
  String message;

  /// 当前请求是否成功
  bool get isSuccess => code == 200;

  ApiResponse({this.data, this.code, this.message});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    var _data = json[ApiResponseKey.KEY_DATA];
    if (_data != null && _data != 'null') {
      data = JsonConvert.fromJsonAsT<T>(_data);
    }
    code = json[ApiResponseKey.KEY_CODE];
    message = json[ApiResponseKey.KEY_MESSAGE];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data[ApiResponseKey.KEY_DATA] = this.data;
    }
    data[ApiResponseKey.KEY_CODE] = this.code;
    data[ApiResponseKey.KEY_MESSAGE] = this.message;
    return data;
  }
}

/// Api请求返回的Response的Key
class ApiResponseKey {
  static const KEY_CODE = "code";
  static const KEY_MESSAGE = "msg";
  static const KEY_DATA = "data";
}
