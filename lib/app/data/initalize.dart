import 'package:firebase_getx_boilerplate/app/data/controllers/detail/controller.dart';
import 'package:firebase_getx_boilerplate/app/data/controllers/image/controller.dart';
import 'package:firebase_getx_boilerplate/app/data/controllers/lifecycle.dart';
import 'package:firebase_getx_boilerplate/app/pages/login/controller.dart';
import 'package:get/get.dart';

class AppInitalizer {
  Future<void> init() async {
    Get.put<LifeCycleController>(LifeCycleController());
    Get.put<ImageController>(ImageController());
    Get.put<LoginController>(LoginController());
    Get.put<DetailImageController>(DetailImageController());
    //await Get.putAsync<DatabaseController>(() => DatabaseController().init());
    //await Get.putAsync<AuthController>(() => AuthController().init());
  }
}
