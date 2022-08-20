import 'package:camera/camera.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:get/get.dart';

class ImageDetailController extends GetxController {
  final file = Get.arguments['file'] as XFile;

  void goToGenerateNFT() {
    Get.toNamed(Routes.generate_nft, arguments: {'file': file});
  }
}
