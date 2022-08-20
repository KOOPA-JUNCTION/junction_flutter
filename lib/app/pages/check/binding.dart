import 'package:firebase_getx_boilerplate/app/pages/check/controller.dart';
import 'package:firebase_getx_boilerplate/app/pages/detail/controller.dart';
import 'package:firebase_getx_boilerplate/app/pages/market/controller.dart';
import 'package:get/get.dart';

class CheckImageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckImageController>(() => CheckImageController());
  }
}
