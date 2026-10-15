import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:len_den/utils/app_colors.dart';
import 'package:len_den/utils/app_global.dart';
import 'package:len_den/utils/app_images.dart';
import 'package:len_den/utils/app_routes.dart';
import 'package:len_den/utils/app_strings.dart';
import 'package:len_den/widgets/custom_btn.dart';
import 'package:len_den/widgets/smooth_page_indigator.dart';
import '../../controllers/onboading_controller.dart';
import '../../widgets/onboadrding_widgets.dart';


class OnboadingScreen extends StatelessWidget {
  const OnboadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final onboardingController = Get.find<OnboardingController>();
    mq = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: onboardingController.pageController,
                  children: [
                    OnBoardingWidget(
                      tittle: AppStrings.everyRuppe,
                      subTittle: AppStrings.trackWhat,
                      semiTittle: AppStrings.lend,
                      img: AppImages.onBoarding,
                    ),
                    OnBoardingWidget(
                      tittle: AppStrings.lend,
                      subTittle: AppStrings.remember,
                      semiTittle: "",
                      img: AppImages.onBoarding2
                    ),
                  ],
                ),
              ),
              // smoothPageIndigator
              const SmoothPageIndigator(),
              const SizedBox(height: 20),

              // continue buttom
              CustomButtom(
                fun: () => Get.toNamed(AppRoutes.loginScreen),
                btnName: AppStrings.continue1,
                bgColor: AppColors.f0e,
                foreGroundColor: AppColors.white,
                size: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                width: double.infinity,
                height: 55,
                borderRadius: 15,
                iconSize: 15,
                spacing: 10,
                icon: CupertinoIcons.arrow_right,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  AppStrings.simplePrivate,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: AppColors.f7181),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
