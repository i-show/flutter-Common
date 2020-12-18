import 'package:app/entries/rake_chain_entity.dart';
import 'package:app/modules/main/home/home_page.dart';
import 'package:app/modules/main/index/main_view_model.dart';
import 'package:app/modules/main/mine/mine_page.dart';
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
  var entry = RakeChainEntity();

  @override
  void initState() {
    super.initState();
    entry.address = "H1";
  }

  @override
  Widget build(BuildContext context) {
    var _pageController = PageController();
    final TestController c = Get.put(TestController());

    return Scaffold(
      body: PageView.builder(
        itemCount: 2,
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) => c.currentIndex = index,
        itemBuilder: (context, index) => _tabList[index],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              onTap: (index) {
                _pageController.jumpToPage(index);
                entry.address = "B$index";
                c.testEntry = entry;
              },
              currentIndex: c.currentIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: c.tab2Name2)
              ])),
    );
  }

  void _pageChanged(int index) {
    print('_pageChanged');
  }
}
