import 'package:app/modules/main/index/main_view_model.dart';
import 'package:common_libs/ext/ext.dart';
import 'package:common_libs/provider/consumer_mediator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ConsumerMediator<MainViewModel>( (context, vm) => Text(vm.count.toString())).intoCenter().intoContainer();
  }

}
