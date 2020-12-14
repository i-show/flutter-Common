import 'package:flutter/material.dart';

/// 基类
abstract class BasePage extends StatefulWidget {}

/// 基类的状态管理
abstract class BasePageState<T extends StatefulWidget> extends State<T> with WidgetsBindingObserver {
  /// 是否绑定Widget状态
  bool get isObserverWidgetsBinding => false;

  @override
  void initState() {
    super.initState();
    if (isObserverWidgetsBinding) {
      WidgetsBinding.instance.addObserver(this);
    }
  }

  @override
  void dispose() {
    if (isObserverWidgetsBinding) {
      WidgetsBinding.instance.removeObserver(this);
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }

}
