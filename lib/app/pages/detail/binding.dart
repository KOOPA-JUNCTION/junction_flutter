import 'package:firebase_getx_boilerplate/app/pages/detail/controller.dart';
import 'package:get/get.dart';

class DetailViewPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailViewPageController>(() => DetailViewPageController());
  }
}
