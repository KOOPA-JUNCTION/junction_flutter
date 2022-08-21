import 'package:firebase_getx_boilerplate/app/pages/stats/repository.dart';
import 'package:get/get.dart';

class StatsController extends GetxController with StateMixin {
  final NftRankRepository repository;
  StatsController(this.repository);

  final Rx<Map> rank = Rx({});

  @override
  void onInit() {
    getNftRank();
    super.onInit();
  }

  void getNftRank() async {
    change(null, status: RxStatus.loading());
    final response = await repository.getNftRank();
    rank.value = response;
    print((rank.value["data"] as List).length);
    change(null, status: RxStatus.success());
  }

  final count = 0.obs;

  void increment() => count.value++;
}
