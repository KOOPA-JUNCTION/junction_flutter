import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_getx_boilerplate/app/data/controllers/image/page.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  late CameraController controller;
  final file = Get.arguments['file'] as XFile;

  void goToGenerateNFT() {
    Get.toNamed(Routes.generate_nft, arguments: {'file': file});
  }

  @override
  void onInit() async {
    final cameras = await availableCameras();
    initCamera(cameras);
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  void initCamera(List<CameraDescription> cameras) async {
    controller = CameraController(cameras[0], ResolutionPreset.max);
    await controller.initialize();
  }

  void openCamera() {
    //Get.to());
  }

  void openImageFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
  }
}
