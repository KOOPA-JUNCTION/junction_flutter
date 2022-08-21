import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with StateMixin {
  RxBool checkLogin = false.obs;

  void login() {
    checkLogin.value = true;
    Get.toNamed(Routes.root);
  }

  bool get isLogined => checkLogin.value;
}
