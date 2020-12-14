import 'dart:ui' as ui;

import 'package:app/entries/rake_chain_container_entity.dart';
import 'package:app/modules/main/home/home_page.dart';
import 'package:app/modules/main/index/main_view_model.dart';
import 'package:app/modules/main/mine/mine_page.dart';
import 'package:app/utils/dio/http.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 当前的index
  int _currentIndex = 0;
  List _tabList = [HomePage(), MinePage()];

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<MainViewModel>();
    return Scaffold(
      body: _tabList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() {
                if (index != _currentIndex) {
                  _currentIndex = index;
                  vm.addCount();
                }
              }),
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Mine')
          ]),
    );
  }
}
