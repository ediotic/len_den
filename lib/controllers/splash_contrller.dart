import 'package:get/get.dart';
import 'package:len_den/utils/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // navigate();
  }
  // navigate
  void navigate(){
    Get.offAllNamed(AppRoutes.onBoardingScreen);
  }
}