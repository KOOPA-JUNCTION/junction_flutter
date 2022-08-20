import 'package:camera/camera.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/layout/adaptive.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/controller.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/widgets/card.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/widgets/story.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:firebase_getx_boilerplate/app/widgets/dropzone.dart';
import 'package:firebase_getx_boilerplate/app/widgets/textfield.dart';
import 'package:firebase_getx_boilerplate/generated/locales.g.dart';
import 'package:flutter/material.dart';

import "dart:js" as js;

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  //var state = js.JsObject.fromBrowserObject(js.context['state']);
  //print(state['hello']);

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    if (isDesktop) return DesktopHomePage();
    return MobileHomePage();
  }
}

class DesktopHomePage extends StatelessWidget {
  DesktopHomePage({Key? key}) : super(key: key);

  final HomePageController controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            header(),
            const SizedBox(height: 40),
            helloUser(),
            FGBPTextField(
              textController: controller.search,
              hintText: "검색할 사진 이름 또는 #해시태그를 입력하세요",
            ),
            const SizedBox(height: 24),
            getImage(),
            const SizedBox(height: 30),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  const Text("스토리", style: AppTextTheme.bold18),
                  const SizedBox(height: 10),
                  StoryCard(
                      category: "풍경",
                      content: "부산 광안리",
                      imgUrl: "assets/images/test_busan.png"),
                  StoryCard(
                      category: "풍경",
                      content: "부산 광안리",
                      imgUrl: "assets/images/test_busan.png"),
                ]),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Row getImage() {
    return Row(
      children: [
        ImageCard(
            imgUrl: "assets/images/gallary.png",
            content: "갤러리에서 사진 가져오기",
            onTap: () {}),
        ImageCard(
            imgUrl: "assets/images/gallary.png",
            content: "갤러리에서 사진 가져오기",
            onTap: () {})
      ],
    );
  }

  Row header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          "ENGLISH",
          style: AppTextTheme.regular12,
        ),
      ],
    );
  }

  Row helloUser() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
              children: [
                TextSpan(
                    text: controller.username.value,
                    style: AppTextTheme.boldMain26),
                const TextSpan(text: "님", style: AppTextTheme.bold26),
              ],
            )),
            const Text("지금 기록을 남겨보세요", style: AppTextTheme.bold26)
          ],
        ),
        Image.asset("assets/images/backpack.png")
      ],
    );
  }
}

class MobileHomePage extends StatelessWidget {
  MobileHomePage({Key? key}) : super(key: key);

  final HomePageController controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            FGBPTextButton(
              text: LocaleKeys.buttons_login.tr,
              radius: 10,
              onTap: () {
                js.context.callMethod(
                    "alertMessage", ["Flutter is Calling upon JavaScript"]);
              },
            ),
            const SizedBox(height: 8),
            FGBPTextButton(
              text: LocaleKeys.buttons_logout.tr,
              radius: 10,
              onTap: () {
                js.context.callMethod('logger', ["flutterState"]);
              },
            ),
            controller.obx((state) => CameraPreview(controller.controller))
          ],
        ),
      )),
    );
  }
}
