import 'package:app/modules/main/index/main_view_model.dart';
import 'package:common_libs/modules/base_page.dart';
import 'package:common_libs/provider/selector_mediator.dart';
import 'package:flutter/material.dart';

class MinePage extends BasePage {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends BasePageState<MinePage> {
  @override
  bool get isObserverWidgetsBinding => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SelectorMediator<MainViewModel, int>(
        selector: (vm) => vm.count, builder: (context, data) => Text(data.toString()));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }
}
