import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Provider中的Selector 构建
class SelectorMediator<VM extends ChangeNotifier, S> extends StatelessWidget{
  final Widget Function(BuildContext, S) builder;
  final S Function(VM value) selector;

  SelectorMediator( {
    @required this.builder,
    @required this.selector,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    S s = context.select<VM, S>(selector);
    log("s= $s");
    return builder(context, s);
  }
}
