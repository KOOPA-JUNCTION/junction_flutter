import 'package:get/get.dart';

import '../controllers/generate_nft_controller.dart';

class GenerateNftBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenerateNftController>(
      () => GenerateNftController(),
    );
  }
}
