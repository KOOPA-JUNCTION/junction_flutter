import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfilePageController extends GetxController with StateMixin {
  RxString username = "주자훈".obs;

  RxString category = "".obs;
  RxString content = "".obs;
  RxString imgUrl = "".obs;
  RxString owner = "".obs;
  RxString coin = "".obs;

}
