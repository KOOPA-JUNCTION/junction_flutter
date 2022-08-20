import 'package:firebase_getx_boilerplate/app/pages/profile/controller.dart';
import 'package:get/get.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePageController>(
      () => ProfilePageController(),
    );
  }
}
