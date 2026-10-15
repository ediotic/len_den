import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/splash_contrller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_global.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../widgets/custom_btn.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final controller = Get.find<SplashController>();
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(child: Image.asset(AppImages.splash, fit: BoxFit.cover)),
            ],
          ),
          Positioned(
            bottom: mq.height * 0.13,
            left: 0,
            right: 0,
            child: Center(
              child: CustomButtom(
                fun: controller.navigate,
                btnName: AppStrings.getStarted,
                bgColor: AppColors.white,
                foreGroundColor: AppColors.mainGreen,
                size: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                width: 330,
                height: 55,
                borderRadius: 15,
                iconSize: 20,
                spacing: 10,
                icon: CupertinoIcons.arrow_right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

