import 'package:app/modules/main/index/main_view_model.dart';
import 'package:app/utils/ext/widget_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Selector<MainViewModel, int>(
        builder: (context, data, child) => Text(data.toString()),
        selector: (context, vm) => vm.count).intoCenter().intoContainer();
  }
}
