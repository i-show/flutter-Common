import 'package:app/utils/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
        child: Container(
      alignment: Alignment.center,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.red;
              } else {
                return Colors.blue;
              }
            }),
            elevation: MaterialStateProperty.all(5),
            shadowColor: MaterialStateProperty.all(Colors.red),
          ),
          onPressed: () => Get.toNamed(Routers.testA),
          child: Text("HomePage")),
    ));
  }
}
