import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  //TODO: Implement SearchController

  List<Map> categories = [
    {
      "imgUrl": "assets/images/Dolphin.png",
      "name": "Dolphin",
    },
    {
      "imgUrl": "assets/images/art.png",
      "name": "Art",
    },
    {
      "imgUrl": "assets/images/collect.png",
      "name": "Collectible",
    },
    {
      "imgUrl": "assets/images/domain.png",
      "name": "Domain Name",
    },
    {
      "imgUrl": "assets/images/Dolphin.png",
      "name": "Dolphin",
    },
  ];

  List<String> imgUrl = [
    "assets/images/test_1.png",
    "assets/images/test_2.png",
    "assets/images/test_3.png",
    "assets/images/test_4.png",
    "assets/images/test_5.png",
    "assets/images/test_6.png",
    "assets/images/test_7.png",
    "assets/images/test_8.png",
    "assets/images/test_9.png",
    "assets/images/test_10.png",
    "assets/images/test_11.png",
    "assets/images/test_12.png",
  ];

  final count = 0.obs;

  void increment() => count.value++;

  void moveToDetailView() {
    Get.toNamed(Routes.search_detail);
  }

  void moveToBuyView() {
    Get.toNamed(Routes.search_buy);
  }
}
