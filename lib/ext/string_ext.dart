
/// 字符创扩展
extension StringExt on String {
  /// 判断当前字符创是否是空
  bool isNullOrEmpty() {
    if (this == null || this.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}