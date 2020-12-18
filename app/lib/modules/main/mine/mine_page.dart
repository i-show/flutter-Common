import 'package:common_libs/utils/log.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    Log.d("yhy", "initState");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Log.d("yhy", "build");
    return Text("AAA");
  }
}
