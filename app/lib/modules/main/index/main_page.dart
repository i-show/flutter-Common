import 'dart:developer';

import 'package:app/entries/rake_chain_container_entity.dart';
import 'package:app/modules/main/home/home_page.dart';
import 'package:app/modules/main/index/main_view_model.dart';
import 'package:app/modules/main/mine/mine_page.dart';
import 'package:app/utils/dio/http.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;

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
                  getHttp();
                }
              }),
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Mine')
          ]),
    );
  }

  void getHttp() async {
    // Response response = await dio.get("https://api.adunpai.com/v1/rakechain/select");
    // Response response = await dio.get("http://test-video.yunkaiwangluo.net:8000/api/member/info/3");
    // var res = ApiResponse<RakeChainContainerEntity>.fromJson(response.data);
    var res = await http.get<RakeChainContainerEntity>("v1/rakechain/select?uuid=1112");
    // var res = await http.get<RakeChainContainerEntity>("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606902435173&di=88200823b8bfc2faf9fa23fa9f178365&imgtype=0&src=http%3A%2F%2Fa4.att.hudong.com%2F27%2F67%2F01300000921826141299672233506.jpg");

    // var res = await dio.requestGet("https://www.baidu.com/");
    if (res.isSuccess) {
      print("request is success");
    } else {
      print("request failed, code = ${res.code}, message = ${res.message}");
    }
  }
}
