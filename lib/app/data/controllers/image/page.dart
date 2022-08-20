import 'package:camera/camera.dart';
import 'package:firebase_getx_boilerplate/app/data/controllers/image/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  final ImageController _controller = Get.find<ImageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      // 카메라 프리뷰를 보여주기 전에 컨트롤러 초기화를 기다려야 합니다. 컨트롤러 초기화가
      // 완료될 때까지 FutureBuilder를 사용하여 로딩 스피너를 보여주세요.
      body: CameraPreview(_controller.controller),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.camera_alt),
          // onPressed 콜백을 제공합니다.
          onPressed: () async {
            // try / catch 블럭에서 사진을 촬영합니다. 만약 뭔가 잘못된다면 에러에
            // 대응할 수 있습니다.

            // 카메라 초기화가 완료됐는지 확인합니다.

            // path 패키지를 사용하여 이미지가 저장될 경로를 지정합니다.

            // 사진 촬영을 시도하고 저장되는 경로를 로그로 남깁니다.
            //await _controller.controller.takePicture(path);

            // 사진을 촬영하면, 새로운 화면으로 넘어갑니다.
            Get.back();
          }),
    );
  }
}
