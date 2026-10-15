import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:len_den/controllers/login_controller.dart';
import 'package:len_den/utils/app_colors.dart';
import 'package:len_den/utils/app_images.dart';
import 'package:len_den/utils/app_routes.dart';
import 'package:len_den/utils/app_strings.dart';
import 'package:len_den/widgets/custom_btn.dart';

import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.all(25),
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: AppColors.ff7f9,
              borderRadius: BorderRadius.circular(30),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.fe8,
                    child: Icon(
                      Icons.currency_rupee_outlined,
                      fontWeight: FontWeight.w900,
                      size: 50,
                      color: AppColors.f0e,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    AppStrings.welcomeBack,
                    style: TextStyle(
                      color: AppColors.darkGreen,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    AppStrings.logInToMange,
                    style: TextStyle(color: AppColors.f7181, fontSize: 14),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    AppStrings.email,
                    style: TextStyle(
                      color: AppColors.darkGreen,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),

                  /// Email
                  CustomTextField(
                    hintText: AppStrings.enterEmail,
                    suffix: Icons.email_outlined,
                    onSuffixTap: null,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    AppStrings.pass,
                    style: TextStyle(
                      color: AppColors.darkGreen,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),

                  /// Password
                  Obx(
                    () => CustomTextField(
                      obscureText: loginController.isVisible.value,
                      hintText: AppStrings.enterPass,
                      suffix: loginController.isVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off_outlined,
                      onSuffixTap: loginController.toggleEye,
                    ),
                  ),
                  const SizedBox(height: 10),

                  /// forgot password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Get.toNamed(AppRoutes.forgotScreen),
                        child: Text(
                          AppStrings.forgot,
                          style: TextStyle(
                            color: AppColors.f0e,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  CustomButtom(
                    fun: () {},
                    btnName: AppStrings.logIn,
                    bgColor: AppColors.f0e,
                    foreGroundColor: AppColors.white,
                    size: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    width: 342,
                    height: 55,
                    borderRadius: 15,
                    iconSize: 15,
                    spacing: 10,
                    icon: CupertinoIcons.arrow_right,
                  ),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      const Expanded(
                        child: Divider(thickness: 1, indent: 10, endIndent: 10),
                      ),

                      Text(
                        AppStrings.orContinue,
                        style: TextStyle(color: AppColors.f7181, fontSize: 12),
                      ),

                      const Expanded(
                        child: Divider(thickness: 1, indent: 10, endIndent: 10),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomButtom(
                    fun: () {},
                    btnName: AppStrings.continueWithGoogle,
                    bgColor: AppColors.white,
                    foreGroundColor: AppColors.darkGreen,
                    size: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    width: 342,
                    height: 55,
                    borderRadius: 15,
                    iconSize: 15,
                    spacing: 10,
                    image: AppImages.google,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.dont,
                        style: TextStyle(
                          color: AppColors.darkGreen,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(AppRoutes.signUpScreen),
                        child: Text(
                          AppStrings.signUp,
                          style: TextStyle(
                            color: AppColors.f0e,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
