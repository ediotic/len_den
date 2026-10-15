import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxBool isVisible = false.obs;

  void toggleEye(){
    isVisible.value = !isVisible.value;
  }
}