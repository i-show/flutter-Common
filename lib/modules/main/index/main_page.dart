import 'package:common/modules/main/home/home_page.dart';
import 'package:common/modules/main/index/main_view_model.dart';
import 'package:common/modules/main/mine/mine_page.dart';
import 'package:common/utils/dio/Interceptor/app_interceptor.dart';
import 'package:common/utils/ext/dio/dio_ext.dart';
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
    try {
      var dio = Dio();
      dio.interceptors.add(LogInterceptor());
      dio.interceptors.add(AppInterceptor());
      // Response response = await dio.get("https://api.adunpai.com/v1/rakechain/select");
      // Response response = await dio.get("http://test-video.yunkaiwangluo.net:8000/api/member/info/3");
      // var res = ApiResponse<RakeChainContainerEntity>.fromJson(response.data);
      var res = await dio.requestGet("http://test-video.yunkaiwangluo.net:8000/api/member/info/3");
      // var res = await dio.requestGet("https://www.baidu.com/");
      if (res.isSuccess) {
        print("request is success");
      } else {
        print("request failed, code = ${res.code}, message = ${res.message}");
      }
    } catch (e) {
      print("catch error = ${e.error}");
      print(e);
    }
  }
}
