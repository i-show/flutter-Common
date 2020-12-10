import 'package:app/modules/main/index/main_view_model.dart';
import 'package:common_libs/provider/selector_mediator.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/ext/widget_ext.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return SelectorMediator<MainViewModel, int>(
        selector: (vm) => vm.count,
        builder: (context, data) => Text(data.toString())).intoCenter();
  }
}
