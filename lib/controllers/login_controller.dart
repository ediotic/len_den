import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:len_den/utils/app_routes.dart';

import 'auth_controller.dart';

class LoginController extends GetxController {
  RxBool isVisible = false.obs;
  // Text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // form key
  final formKey = GlobalKey<FormState>();

  // auth comtroller
  final AuthController authController = Get.find<AuthController>();
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // toggle
  void toggleEye() {
    isVisible.value = !isVisible.value;
  }

  // Email validation
  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }

    if (!GetUtils.isEmail(value.trim())) {
      return 'Please enter a valid email';
    }

    return null;
  }

  // Password validation
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    return null;
  }

  // Register user
  Future<void> submit() async {
    // Validate complete form
    if (formKey.currentState == null || !formKey.currentState!.validate()) {
      return;
    }

    // Call AuthController
    final success = await authController.userLogin(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    if (success) {
      Get.snackbar(
        'Success',
        'login successfully!',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'login Failed',
        authController.errorMsg.value,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    if(success){
      Get.offAllNamed(AppRoutes.bottomTabsScreen);
    }
  }
}
