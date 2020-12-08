import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderConsumerMediator<VM extends ChangeNotifier> extends StatefulWidget {
  final ValueWidgetBuilder<VM> builder;
  final Widget child;
  final Function(VM model) onModelReady;
  final bool autoDispose;

  ProviderConsumerMediator({
    Key key,
    @required this.builder,
    this.child,
    this.onModelReady,
    this.autoDispose: true,
  }) : super(key: key);

  _ProviderConsumerMediatorState<VM> createState() => _ProviderConsumerMediatorState<VM>();
}

class _ProviderConsumerMediatorState<VM extends ChangeNotifier> extends State<ProviderConsumerMediator<VM>> {
  VM vm;

  @override
  void initState() {
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
    vm = context.watch<VM>();
    return ChangeNotifierProvider<VM>.value(
      value: vm,
      child: Consumer<VM>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
