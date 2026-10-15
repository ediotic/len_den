
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? prefix;
  final IconData? suffix;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final VoidCallback? onSuffixTap;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefix,
    this.suffix,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.onSuffixTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: prefix != null
              ? Icon(
                  prefix,
                  color: AppColors.f0e,
                )
              : null,

          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: onSuffixTap,
                  icon: Icon(
                    suffix,
                    color: AppColors.f0e,
                  ),
                )
              : null,

          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.f7181,
            fontSize: 14,
          ),

          border: InputBorder.none,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}
