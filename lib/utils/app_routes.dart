import 'package:get/get.dart';
import 'package:len_den/screens/auth/forgot_screen.dart';
import 'package:len_den/screens/auth/login_Screen.dart';
import 'package:len_den/screens/auth/sign_up_screen.dart';
import 'package:len_den/screens/onboarding/onboading_screen.dart';

import '../screens/splash/splash_screen.dart';

class AppRoutes {
 static const String splashScreen = "/splashScreen";
 static const String onBoardingScreen = "/onBoadingScreen";
 static const String loginScreen = "/loginScreen";
 static const String signUpScreen = "/signUpScreen";
 static const String forgotScreen = "/forgotScreen";


 static final List<GetPage> routes = [
  GetPage(name: splashScreen, page: () => SplashScreen()),
  GetPage(name: onBoardingScreen, page: () => OnboadingScreen()),
  GetPage(name: loginScreen, page: () => LoginScreen()),
  GetPage(name: signUpScreen, page: () => SignUpScreen()),
  GetPage(name: forgotScreen, page: () => ForgotScreen()),
 ];
}