import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:get/get.dart';

class ImageDetailController extends GetxController {
  //final file = Get.arguments['file'] as XFile;

  //final XFile file = ;

  void goToGenerateNFT() {
    Get.toNamed(Routes.generate_nft, arguments: {'file': ""});
  }
}
