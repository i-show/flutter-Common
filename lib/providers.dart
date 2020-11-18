import 'package:common/modules/main/index/main_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildStatelessWidget> providers = [
  ChangeNotifierProvider<MainViewModel>(
    create: (_) => MainViewModel(),
  ),
];
