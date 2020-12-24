import 'package:app/modules/test/ripple_router.dart';
import 'package:app/utils/router/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestA extends StatefulWidget {
  @override
  _TestAState createState() => _TestAState();
}

class _TestAState extends State<TestA> {
  @override
  Widget build(BuildContext context) {
    var key1 = GlobalKey();
    var key2 = GlobalKey();
    return Scaffold(
        appBar: AppBar(
          title: Text('appbarTitle'),
        ),
        body: Container(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                ElevatedButton(
                    child: Text("This is Page A", key: key1),
                    // onPressed: () => Get.toNamed(Routers.testB),
                    onPressed: () => Navigator.of(context).push(
                      RippleRoute(TestB(), RouteConfig.fromContext(key2.currentContext)),)
                ),

                ElevatedButton(
                    child: Text("This is Page A2", key: key2),
                    onPressed: () => Get.toNamed(Routers.testB),
                )
              ],
            )
        ));
  }
}



class TestB extends StatefulWidget {
  @override
  _TestBState createState() => _TestBState();
}

class _TestBState extends State<TestB> {
  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.black,
      alignment: Alignment.topCenter,
      child: Container(height: 50, color: Colors.orange),
    );
  }
}
