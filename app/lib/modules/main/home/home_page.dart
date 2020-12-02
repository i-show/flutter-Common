import 'package:app/modules/main/index/main_view_model.dart';
import 'package:app/utils/ext/widget_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewModel>(builder: (context, vm, _) => Text(vm.count.toString())).intoCenter().intoContainer();
  }

}
