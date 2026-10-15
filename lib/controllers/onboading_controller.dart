import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnboardingController extends GetxController {
  final pageController = PageController();
  RxInt currPageIdx = 0.obs;

  /// UPDATE CURR INDEX WHEN PAGE IS SCROLL
  void updatePageIndigator(int index) => currPageIdx.value = index;

  /// JUMP TO THE SPECIFIC DOT SELECTED PAGE
  void dotNavigationClick(int index) {
    currPageIdx.value = index;
    pageController.jumpToPage(index);
  }

}