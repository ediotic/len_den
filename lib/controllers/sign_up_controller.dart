
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:len_den/controllers/auth_controller.dart';
import 'package:len_den/utils/app_routes.dart';

class SignUpController extends GetxController {
  // Auth controller
  final AuthController authController = Get.find<AuthController>();

  // Form key
  final formKey = GlobalKey<FormState>();

  // Text controllers
  final nameController = TextEditingController();
  final phnNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Password visibility
  final RxBool isVisible = false.obs;
  final RxBool isConfirmVisible = false.obs;

  // Toggle password visibility
  void toggleEye() {
    isVisible.toggle();
  }

  // Toggle confirm password visibility
  void confirmToggleEye() {
    isConfirmVisible.toggle();
  }

  // Name validation
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your full name';
    }
    return null;
  }

  // Phone number validation
  String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your phone number';
    }

    if (!RegExp(r'^\+?[0-9]{10,15}$')
        .hasMatch(value.trim())) {
      return 'Please enter a valid phone number';
    }

    return null;
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

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    return null;
  }

  // Confirm password validation
  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != passwordController.text) {
      return 'Passwords do not match';
    }

    return null;
  }

  // Register user
  Future<void> submit() async {
    // Validate complete form
    if (formKey.currentState == null ||
        !formKey.currentState!.validate()) {
      return;
    }

    // Call AuthController
    final success = await authController.userRegister(
      name: nameController.text.trim(),
      phnNumber: phnNumberController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    if (success) {
      Get.snackbar(
        'Success',
        'Account created successfully!',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Registration Failed',
        authController.errorMsg.value,
        snackPosition: SnackPosition.BOTTOM,
      );
      if(success){
        Get.offAllNamed(AppRoutes.bottomTabsScreen);
      }
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    phnNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.onClose();
  }
}