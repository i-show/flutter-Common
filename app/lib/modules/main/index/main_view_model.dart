import 'package:app/entries/rake_chain_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainViewModel with ChangeNotifier {
  int _count = 0;

  get count => _count;

  var _currentIndex = 0;

  get currentIndex => _currentIndex;

  setCurrentIndex(value) {
    _currentIndex = value;
    notifyListeners();
  }

  addCount() {
    _count++;
    notifyListeners();
  }

  subCount() {
    _count--;
    notifyListeners();
  }
}

class TestController extends GetxController {
  final _name = "Home".obs;

  set name(value) => _name.value = value;

  get name => _name.value;

  final _currentIndex = 0.obs;

  set currentIndex(value) => _currentIndex.value = value;

  get currentIndex => _currentIndex.value;

  get tab2Name => _name.value + _currentIndex.value.toString();

  final _testEntry = RakeChainEntity().obs;

  get testEntry => _testEntry.value;

  set testEntry(val) => _testEntry.value = val;

  get tab2Name2 => "${_name.value}${_testEntry.value.address??""}";
}
