import 'package:flutter/material.dart';

extension EdgeInsetsExt on num {
  /// 距离顶部距离
  ///[EdgeInsets.only]
  EdgeInsets get edgeTop => EdgeInsets.only(top: this);

  /// 距离底部距离
  ///[EdgeInsets.only]
  EdgeInsets get edgeBottom => EdgeInsets.only(bottom: this);

  /// 距离左边距离
  ///[EdgeInsets.only]
  EdgeInsets get edgeLeft => EdgeInsets.only(left: this);

  /// 距离右边距离
  ///[EdgeInsets.only]
  EdgeInsets get edgeRight => EdgeInsets.only(right: this);

  /// 所有边距
  ///[EdgeInsets.all]
  EdgeInsets get edgeAll => EdgeInsets.all(this);
}
