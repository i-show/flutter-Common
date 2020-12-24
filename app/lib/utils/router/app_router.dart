import 'package:app/modules/main/index/main_page.dart';
import 'package:app/modules/test/test_a.dart';
import 'package:get/get.dart';

class AppRouter {
  static List<GetPage> pages = [
    GetPage(
      name: Routers.main,
      page: () => MainPage(),
    ),
    GetPage(
      name: Routers.testA,
      page: () => TestA(),
    ),
    GetPage(
      name: Routers.testB,
      page: () => TestB(),
      transition: Transition.noTransition
    ),
  ];
}

class Routers {
  static var splash = "/";
  static var main = "/main";
  static var testA = "/testA";
  static var testB = "/testB";
}
