import 'package:camera/camera.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/layout/adaptive.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/controller.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/widgets/popular.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/widgets/today.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/widgets/trending.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Image.asset("assets/images/logo.png"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            header(),
            const SizedBox(height: 40),
            helloUser(),
            const SizedBox(height: 24),
            getImage(),
            const SizedBox(height: 30),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: const [
                  Text("스토리", style: AppTextTheme.bold18),
                  SizedBox(height: 10),
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Image.asset("assets/images/logo.png"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            popular(),
            const SizedBox(height: 10),
            Expanded(child: trendingCollection()),
            const SizedBox(height: 10),
            today(),
          ],
        ),
      )),
    );
  }

  Column today() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 15,
              color: const Color(0xb31e299c),
            ),
            const SizedBox(width: 2),
            const Text("Today's Pick", style: AppTextTheme.bold20),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(
                child: TodayCard(
                    content: "KOOFA ZOO",
                    imgUrl: "assets/images/test_6.png",
                    category: "")),
            Expanded(
                child: TodayCard(
                    content: "KOOFA ZOO",
                    imgUrl: "assets/images/test_7.png",
                    category: "")),
          ],
        )
      ],
    );
  }

  Column trendingCollection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 15,
              color: const Color(0xb31e299c),
            ),
            const SizedBox(width: 2),
            const Text("Trending Collection", style: AppTextTheme.bold20),
          ],
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              CircleCard(
                imgUrl: "assets/images/test_3.png",
                content: "MRA",
                category: "",
              ),
              SizedBox(width: 12),
              CircleCard(
                imgUrl: "assets/images/test_4.png",
                content: "MRA",
                category: "",
              ),
              SizedBox(width: 12),
              CircleCard(
                imgUrl: "assets/images/test_5.png",
                content: "MRA",
                category: "",
              ),
              SizedBox(width: 12),
              CircleCard(
                imgUrl: "assets/images/test_3.png",
                content: "MRA",
                category: "",
              ),
              SizedBox(width: 12),
            ],
          ),
        )
      ],
    );
  }

  Column popular() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 15,
              color: const Color(0xb31e299c),
            ),
            const SizedBox(width: 2),
            const Text("Popular", style: AppTextTheme.bold20),
          ],
        ),
        Row(
          children: const [
            Expanded(
              child: ImageCard(
                imgUrl: "assets/images/test_1.png",
                title: "The Name Of Nft",
                content: "EARTH",
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: ImageCard(
                imgUrl: "assets/images/test_2.png",
                title: "The Name Of Nft",
                content: "EARTH",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
