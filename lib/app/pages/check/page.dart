import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/layout/adaptive.dart';
import 'package:firebase_getx_boilerplate/app/pages/check/controller.dart';

import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:firebase_getx_boilerplate/app/widgets/textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CheckImage extends StatelessWidget {
  const CheckImage({
    Key? key,
    required this.category,
    required this.content,
    required this.imgUrl,
    required this.owner,
    required this.coin,
  }) : super(key: key);

  final String category;
  final String content;
  final String imgUrl;
  final String owner;
  final String coin;

  //var state = js.JsObject.fromBrowserObject(js.context['state']);
  //print(state['hello']);

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    if (isDesktop) {
      return DesktopCheckImage(
        category: category,
        content: content,
        imgUrl: imgUrl,
        owner: owner,
        coin: coin,
      );
    }
    return MobileCheckImage();
  }
}

class DesktopCheckImage extends StatelessWidget {
  DesktopCheckImage({
    Key? key,
    required this.category,
    required this.content,
    required this.imgUrl,
    required this.owner,
    required this.coin,
  }) : super(key: key);

  final String category;
  final String content;
  final String imgUrl;
  final String owner;
  final String coin;

  final CheckImageController controller = Get.find<CheckImageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("이미지 확인", style: AppTextTheme.bold18),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(imgUrl),
            Row(
              children: const [
                Text("나중에 발급하기 (이미지만 저장)"),
                FGBPButton(child: Text("NFT 발급하기"))
              ],
            ),
          ],
        ),
      )),
    );
  }
}

class MobileCheckImage extends StatelessWidget {
  MobileCheckImage({Key? key}) : super(key: key);

  final CheckImageController controller = Get.find<CheckImageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail on Nft", style: AppTextTheme.bold18),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          Image.asset(""),
          const Text("1. Name", style: AppTextTheme.bold18),
          FGBPTextField(textController: controller.nameController),
          FGBPTextField(textController: controller.nameController),
          FGBPTextField(textController: controller.nameController),
          FGBPTextField(textController: controller.nameController),
          FGBPTextField(textController: controller.nameController),
        ],
      )),
    );
  }
}
