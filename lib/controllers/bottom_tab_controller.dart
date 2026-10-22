import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomTabController extends GetxController {
  final pageController = PageController();
  RxInt selectedIndex = 0.obs;

  void changeTab(int index){
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }
  void onPageChanged(int index){
   selectedIndex.value = index;
  }
}