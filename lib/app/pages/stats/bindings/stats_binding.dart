import 'package:firebase_getx_boilerplate/app/data/provider/api.dart';
import 'package:firebase_getx_boilerplate/app/data/provider/api_interface.dart';
import 'package:firebase_getx_boilerplate/app/pages/stats/repository.dart';
import 'package:get/get.dart';

import '../controllers/stats_controller.dart';

class StatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatsController>(() => StatsController(
          NftRankRepository(FGBPApiProvider()),
        ));
  }
}
