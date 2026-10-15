import 'package:get/get.dart';
import 'package:len_den/controllers/login_controller.dart';
import 'package:len_den/controllers/onboading_controller.dart';
import 'package:len_den/controllers/sign_up_controller.dart';
import 'package:len_den/controllers/splash_contrller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => OnboardingController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);

  }
}