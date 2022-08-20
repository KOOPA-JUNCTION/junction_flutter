import 'package:camera/camera.dart';
import 'package:firebase_getx_boilerplate/app/data/controllers/image/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController with StateMixin {
  RxString username = "주자훈".obs;
  final TextEditingController search = TextEditingController();

  final ImageController imageController = Get.find<ImageController>();

  void getImageFromGallary() {
    imageController.openImageFile();
  }
  
  void getImageFromCamera(){
    //Get.
  }

  void onDroppedFile(value) {
    print(value);
  }
}
