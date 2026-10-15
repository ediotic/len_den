import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isVisible = false.obs;

  void toggleEye(){
    isVisible.value = !isVisible.value;
  }
}