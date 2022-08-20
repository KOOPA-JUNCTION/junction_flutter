import 'package:camera/camera.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/layout/adaptive.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/controller.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/widgets/card.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/widgets/story.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
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
                child: Column(children: const [
                  Text("스토리", style: AppTextTheme.bold18),
                  SizedBox(height: 10),
                  StoryCard(
                      category: "풍경",
                      content: "부산 광안리",
                      imgUrl: "assets/images/test_busan.png"),
                  SizedBox(height: 10),
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
        Expanded(
          child: ImageCard(
              imgUrl: "assets/images/gallary.png",
              title: "갤러리에서",
              content: "사진 가져오기",
              onTap: () {}),
        ),
        const SizedBox(width: 22),
        Expanded(
          child: ImageCard(
              imgUrl: "assets/images/camera.png",
              title: "카메라에서",
              content: "사진 촬영히기",
              onTap: () {}),
        )
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
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
            storyHistory(),
          ],
        ),
      )),
    );
  }

  Card storyHistory() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: const [
          Text("스토리", style: AppTextTheme.bold18),
          SizedBox(height: 10),
          StoryCard(
              category: "풍경",
              content: "부산 광안리",
              imgUrl: "assets/images/test_busan.png"),
          const SizedBox(height: 10),
          StoryCard(
              category: "풍경",
              content: "부산 광안리",
              imgUrl: "assets/images/test_busan.png"),
        ]),
      ),
    );
  }

  Row getImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ImageCard(
              imgUrl: "assets/images/gallary.png",
              title: "갤러리에서",
              content: "사진 가져오기",
              onTap: controller.getImageFromGallary),
        ),
        const SizedBox(width: 22),
        Expanded(
          child: ImageCard(
              imgUrl: "assets/images/camera.png",
              title: "카메라에서",
              content: "사진 촬영히기",
              onTap: controller.getImageFromCamera),
        )
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
