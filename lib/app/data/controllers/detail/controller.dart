import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:get/get.dart';

class DetailImageController extends GetxController {
  final RxString imgUrl = "".obs;
  final RxString name = "".obs;
  final RxString coin = "".obs;

  void setImageInfo(imgUrl, name, {coin = "0.03"}) {
    this.imgUrl.value = imgUrl;
    this.name.value = name;
    this.coin.value = coin;
  }

  void moveToDetailView() {
    Get.toNamed(Routes.search_detail);
  }

  void moveToBuyView() {
    Get.toNamed(Routes.search_buy);
  }

  void getToDetailView(imgUrl, name, {coin = "0.03"}) {
    setImageInfo(imgUrl, name);
    moveToDetailView();
  }
}
