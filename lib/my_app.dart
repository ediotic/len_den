
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:len_den/utils/app_theme.dart';

import 'bindings/app_bindings.dart';
import 'utils/app_routes.dart';

class LenDen extends StatelessWidget {
  const LenDen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Len Den',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.splashScreen,
      getPages: AppRoutes.routes,
      initialBinding: AppBindings(),
    );
  }
}
