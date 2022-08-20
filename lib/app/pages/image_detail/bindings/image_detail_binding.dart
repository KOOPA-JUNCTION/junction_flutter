import 'package:get/get.dart';

import '../controllers/image_detail_controller.dart';

class ImageDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageDetailController>(
      () => ImageDetailController(),
    );
  }
}
