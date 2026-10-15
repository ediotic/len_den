import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final VoidCallback fun;
  final String btnName;
  final String? image;

  final IconData? icon;
  final Color bgColor;
  final Color foreGroundColor;
  // final Color textColor;
  // final Color iconColor;

  final TextStyle size;

  final double width;
  final double height;
  final double borderRadius;
  final double iconSize;
  final double spacing;

  const CustomButtom({
    super.key,
    required this.fun,
    required this.btnName,
    this.icon,
    this.image,
    required this.bgColor,
    required this.foreGroundColor,
    // required this.textColor,
    // required this.iconColor,
    required this.size,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.iconSize,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: foreGroundColor,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: fun,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(btnName, style: size),
            if (icon != null) ...[
              SizedBox(width: spacing),
              Icon(icon, size: iconSize),
            ],
            if (image != null) ...[
              SizedBox(width: spacing),
              Image.asset(image.toString()),
            ],
          ],
        ),
      ),
    );
  }
}
