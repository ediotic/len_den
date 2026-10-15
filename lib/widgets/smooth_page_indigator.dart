
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/app_colors.dart';
import '../controllers/onboading_controller.dart';

class SmoothPageIndigator extends StatelessWidget {
  const SmoothPageIndigator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final onboardingController = Get.find<OnboardingController>();
    return SmoothPageIndicator(
      controller: onboardingController.pageController,
      onDotClicked: onboardingController.dotNavigationClick,
      count: 2,
      effect: const ExpandingDotsEffect(
        dotColor: AppColors.f7181,
        activeDotColor: AppColors.mainGreen,
        dotHeight: 7,
      ),
    );
  }
}