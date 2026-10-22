
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:len_den/utils/app_colors.dart';

import '../../controllers/bottom_tab_controller.dart';

class BottomTabs extends StatelessWidget {
  const BottomTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomTabController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Screens
          Positioned.fill(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              children: const [
                Center(child: Text('Home Screen')),
                Center(child: Text('t history')),
                Center(child: Text('add frnd')),
                Center(child: Text('frnds')),
                Center(child: Text('Profile Screen')),
              ],
            ),
          ),

          // Floating Bottom Navigation Bar
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.ff7f9,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 20,
                      spreadRadius: 1,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTab(
                        controller,
                        CupertinoIcons.home,
                        0,
                      ),
                      _buildTab(
                        controller,
                        CupertinoIcons.time,
                        1,
                      ),
                      _buildTab(
                        controller,
                        CupertinoIcons.add_circled,
                        2,
                      ),
                      _buildTab(
                        controller,
                        CupertinoIcons.person_2,
                        3,
                      ),
                      _buildTab(
                        controller,
                        CupertinoIcons.person,
                        4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(
    BottomTabController controller,
    IconData icon,
    int index,
  ) {
    final isSelected = controller.selectedIndex.value == index;

    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => controller.changeTab(index),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.fe8 : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          icon,
          size: 25,
          color: isSelected ? AppColors.f0e : AppColors.darkGreen,
        ),
      ),
    );
  }
}