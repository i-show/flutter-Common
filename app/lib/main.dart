import 'dart:io';

import 'package:app/utils/dio/http.dart';
import 'package:app/utils/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'modules/main/index/main_page.dart';
import 'package:get/get.dart';

void main() {
  http.init();
  runApp(MyApp());

  if (Platform.isAndroid) {
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark);

    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  } else {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      title: 'Flutter Common',
      theme: ThemeData(
        backgroundColor: Colors.red,
        scaffoldBackgroundColor: Colors.grey,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
      getPages: AppRouter.pages,
    );
  }
}
