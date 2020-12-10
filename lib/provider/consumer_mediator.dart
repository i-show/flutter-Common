import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConsumerMediator<VM extends ChangeNotifier> extends StatelessWidget {
  final Widget Function(BuildContext, VM) builder;
  ConsumerMediator(this.builder, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<VM>();
    return builder(context, vm);
  }
}

