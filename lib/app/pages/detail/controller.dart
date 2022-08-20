import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DetailViewPageController extends GetxController with StateMixin {
  RxString username = "주자훈".obs;

  late CameraController controller;

  final TextEditingController search = TextEditingController();

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
    change(null, status: RxStatus.loading());
    controller = CameraController(cameras[0], ResolutionPreset.max);
    await controller.initialize();
    change(null, status: RxStatus.success());
  }

  void onDroppedFile(value) {
    print(value);
  }
}
