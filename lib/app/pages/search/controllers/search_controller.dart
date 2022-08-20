import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  //TODO: Implement SearchController

  final count = 0.obs;

  void increment() => count.value++;

  void moveToDetailView() {
    Get.toNamed(Routes.search_detail);
  }

  void moveToBuyView() {
    Get.toNamed(Routes.search_buy);
  }
}
