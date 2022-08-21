import 'package:firebase_getx_boilerplate/app/pages/home/repository.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController with StateMixin {
  final HomeRepository repository;
  HomePageController(this.repository);

  Rx<Map> popular = Rx({});
  Rx<Map> pick = Rx({});

  @override
  void onInit() {
    getNftPopular();
    super.onInit();
  }

  void getNftPopular() async {
    change(null, status: RxStatus.loading());
    popular.value = await repository.getNftPopular();
    pick.value = await repository.getNftPopular();

    change(null, status: RxStatus.success());
  }
}
