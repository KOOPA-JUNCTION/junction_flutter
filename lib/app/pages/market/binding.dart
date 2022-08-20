import 'package:firebase_getx_boilerplate/app/pages/market/controller.dart';
import 'package:get/get.dart';

class MarketPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarketPageController>(() => MarketPageController());
  }
}
