import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Provider中的Selector 构建
class SelectorMediator<VM extends ChangeNotifier, S> extends StatelessWidget{
  final Widget Function(BuildContext, S) builder;
  final S Function(VM value) selector;

  SelectorMediator( {
    Key key,
    @required this.selector,
    @required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    S s = context.select<VM, S>(selector);
    return builder(context, s);
  }
}
