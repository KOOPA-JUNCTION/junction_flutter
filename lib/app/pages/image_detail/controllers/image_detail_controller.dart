import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageDetailController extends GetxController {
  final Rx<XFile?> file = Rx(null);

  @override
  void onInit() {
    file.value = Get.arguments?['file'] as XFile;
    super.onInit();
  }

  //final XFile file = ;

  void goToGenerateNFT() {
    Get.toNamed(Routes.generate_nft, arguments: {'file': file.value});
  }
}
