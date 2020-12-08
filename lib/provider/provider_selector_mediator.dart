import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Provider中的Selector 构建
class ProviderSelectorMediator<VM extends ChangeNotifier, S> extends StatefulWidget {
  final ValueWidgetBuilder<S> builder;
  final S Function(BuildContext, VM) selector;
  final Widget child;
  final Function(VM model) onModelReady;
  final bool autoDispose;

  ProviderSelectorMediator({
    Key key,
    @required this.selector,
    @required this.builder,
    this.child,
    this.onModelReady,
    this.autoDispose: true,
  }) : super(key: key);

  _ProviderSelectorMediatorState<VM, S> createState() => _ProviderSelectorMediatorState<VM, S>();
}

class _ProviderSelectorMediatorState<VM extends ChangeNotifier, S> extends State<ProviderSelectorMediator<VM, S>> {
  VM vm;

  @override
  void initState() {
    log("ProviderMediator initS");
    widget.onModelReady?.call(vm);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.autoDispose) vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("ProviderMediator build");
    vm = context.watch<VM>();

    return  Selector<VM, S>(
        selector: widget.selector,
        builder: widget.builder,
        child: widget.child,
    );
  }
}
