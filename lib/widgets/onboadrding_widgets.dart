import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_global.dart';

class OnBoardingWidget extends StatelessWidget {
  final String tittle;
  final String subTittle;
  final String semiTittle;
  final String img;

  const OnBoardingWidget({
    super.key,
    required this.tittle,
    required this.subTittle,
    required this.semiTittle,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 100,
          backgroundColor: AppColors.fe8,
          child: Image.asset(
            img,
            width: mq.width * 0.20,
            height: mq.height * 0.20,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          tittle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: AppColors.darkGreen,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          subTittle,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: AppColors.f7181),
        ),
        Text(
          semiTittle,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: AppColors.f7181),
        ),
      ],
    );
  }
}
