import 'package:app/modules/main/home/home_page.dart';
import 'package:app/modules/main/index/main_view_model.dart';
import 'package:app/modules/main/mine/mine_page.dart';
import 'package:app/utils/log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 当前的index
  int _currentIndex = 0;
  List _tabList = [HomePage(), MinePage()];

  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Log.d("_MainPageState", "build --------");
    var _pageController = PageController();
    final TestController c = Get.put(TestController());

    return Scaffold(
      body: PageView.builder(
        itemCount: 2,
        controller: _pageController,
        onPageChanged: (index) => c.currentIndex = index,
        itemBuilder: (context, index) => _tabList[index],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              onTap: (index) => _pageController.jumpToPage(index),
              currentIndex: c.currentIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Mine')
              ])),
    );
  }

  void _pageChanged(int index) {
    print('_pageChanged');
  }
}
