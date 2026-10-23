import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:len_den/controllers/auth_controller.dart';
import 'package:len_den/controllers/sign_up_controller.dart';
import 'package:len_den/utils/app_strings.dart';
import 'package:len_den/utils/auth_state.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_global.dart';
import '../../utils/app_routes.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signupController = Get.find<SignUpController>();
    final authController = Get.find<AuthController>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(AppStrings.createAn),
        ),
        body: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 1900),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 35 * (1 - value)),
                  child: child,
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(25),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppColors.ff7f9,
                borderRadius: BorderRadius.circular(30),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: signupController.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.startTracking,
                        style: TextStyle(color: AppColors.f7181, fontSize: 13),
                      ),

                      const SizedBox(height: 25),

                      // Full name
                      Text(
                        AppStrings.fullNmae,
                        style: TextStyle(
                          color: AppColors.darkGreen,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),

                      CustomTextField(
                        controller: signupController.nameController,
                        hintText: AppStrings.yourFull,
                        suffix: Icons.person_2_outlined,
                        onSuffixTap: null,
                        validator: signupController.validateName,
                      ),

                      const SizedBox(height: 15),

                      // Email
                      Text(
                        AppStrings.email,
                        style: TextStyle(
                          color: AppColors.darkGreen,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),

                      CustomTextField(
                        controller: signupController.emailController,
                        hintText: AppStrings.example,
                        suffix: Icons.email_outlined,
                        onSuffixTap: null,
                        validator: signupController.validateEmail,
                      ),

                      const SizedBox(height: 15),

                      // Phone number
                      Text(
                        AppStrings.mbNum,
                        style: TextStyle(
                          color: AppColors.darkGreen,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),

                      CustomTextField(
                        controller: signupController.phnNumberController,
                        hintText: '8923858546',
                        suffix: Icons.phone_android_sharp,
                        onSuffixTap: null,
                        validator: signupController.validatePhone,
                      ),

                      const SizedBox(height: 15),

                      // Password
                      Text(
                        AppStrings.pass,
                        style: TextStyle(
                          color: AppColors.darkGreen,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),

                      Obx(
                        () => CustomTextField(
                          controller: signupController.passwordController,
                          obscureText: !signupController.isVisible.value,
                          hintText: AppStrings.atLeast,
                          suffix: signupController.isVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off_outlined,
                          onSuffixTap: signupController.toggleEye,
                          validator: signupController.validatePassword,
                        ),
                      ),

                      const SizedBox(height: 15),

                      // Confirm password
                      Text(
                        AppStrings.reEnter,
                        style: TextStyle(
                          color: AppColors.darkGreen,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),

                      Obx(
                        () => CustomTextField(
                          controller:
                              signupController.confirmPasswordController,
                          obscureText: !signupController.isConfirmVisible.value,
                          hintText: AppStrings.reEnter,
                          suffix: signupController.isConfirmVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off_outlined,
                          onSuffixTap: signupController.confirmToggleEye,
                          validator: signupController.validateConfirmPassword,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        AppStrings.terms,
                        style: TextStyle(color: AppColors.f7181, fontSize: 12),
                      ),

                      SizedBox(height: mq.height * 0.04),

                      // Register button and loading indicator
                      Obx(() {
                        final isLoading =
                            authController.authState.value == AuthState.loading;

                        return SizedBox(
                          width: double.infinity,
                          child: isLoading
                              ? Container(
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: AppColors.f0e,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 22,
                                        width: 22,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.5,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        'Please wait...',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : CustomButtom(
                                  fun: signupController.submit,
                                  btnName: AppStrings.createAccount,
                                  bgColor: AppColors.f0e,
                                  foreGroundColor: AppColors.white,
                                  size: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  width: 342,
                                  height: 55,
                                  borderRadius: 15,
                                  iconSize: 15,
                                  spacing: 10,
                                  icon: CupertinoIcons.arrow_right,
                                ),
                        );
                      }),

                      SizedBox(height: mq.height * 0.04),

                      // Login navigation
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.already,
                            style: TextStyle(
                              color: AppColors.darkGreen,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () => Get.toNamed(AppRoutes.loginScreen),
                            child: Text(
                              AppStrings.logIn,
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
        ),
      ),
    );
  }
}
