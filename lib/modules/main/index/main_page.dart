import 'package:common/entries/test_entity.dart';
import 'package:common/modules/main/home/home_page.dart';
import 'package:common/modules/main/index/main_view_model.dart';
import 'package:common/modules/main/mine/mine_page.dart';
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
    TestEntity().toJson();
    return Scaffold(
      body: _tabList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() {
                if(index != _currentIndex) {
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
