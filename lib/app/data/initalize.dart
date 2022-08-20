import 'package:firebase_getx_boilerplate/app/data/controllers/image/controller.dart';
import 'package:firebase_getx_boilerplate/app/data/controllers/lifecycle.dart';
import 'package:get/get.dart';

class AppInitalizer {
  Future<void> init() async {
    Get.put<LifeCycleController>(LifeCycleController());
    Get.put<ImageController>(ImageController());
    //await Get.putAsync<DatabaseController>(() => DatabaseController().init());
    //await Get.putAsync<AuthController>(() => AuthController().init());
  }
}
