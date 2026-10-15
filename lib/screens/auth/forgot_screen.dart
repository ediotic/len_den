import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:len_den/utils/app_colors.dart';
import 'package:len_den/utils/app_strings.dart';

import '../../widgets/custom_btn.dart';
import '../../widgets/custom_text_field.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyActions: true,
          title: Text(AppStrings.forgot),
        ),
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
                      Icons.email_outlined,
                      fontWeight: FontWeight.w900,
                      size: 50,
                      color: AppColors.f0e,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    AppStrings.resetPass,
                    style: TextStyle(
                      color: AppColors.darkGreen,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    AppStrings.enterYourRegis,
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
                    hintText: AppStrings.example,
                    suffix: Icons.email_outlined,
                    onSuffixTap: null,
                  ),
                  const SizedBox(height: 40),
                  CustomButtom(
                    fun: () {},
                    btnName: AppStrings.sendRest,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
