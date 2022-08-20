import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/layout/adaptive.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/controller.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/widgets/popular.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/widgets/today.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/widgets/trending.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(LocaleKeys.home_title.tr),
        titleTextStyle: Get.textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w900,
          color: const Color(0xff1e299c),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              popular(),
              const SizedBox(height: 50),
              trendingCollection(),
              const SizedBox(height: 50),
              today(),
            ],
          ),
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
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: TodayCard(
                    content: "KOOFA ZOO",
                    imgUrl: "assets/images/test_6.png",
                    category: "")),
            SizedBox(width: 20),
            Expanded(
                child: TodayCard(
                    content: "KOOFA ZOO",
                    imgUrl: "assets/images/test_7.png",
                    category: "")),
            SizedBox(width: 20),
            Expanded(
                child: TodayCard(
                    content: "KOOFA ZOO",
                    imgUrl: "assets/images/test_7.png",
                    category: "")),
            SizedBox(width: 20),
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
            children: [
              CircleCard(
                imgUrl: "assets/images/test_3.png",
                content: "MRA",
                category: "",
              ),
              const SizedBox(width: 12),
              CircleCard(
                imgUrl: "assets/images/test_4.png",
                content: "MRB",
                category: "",
              ),
              const SizedBox(width: 12),
              CircleCard(
                imgUrl: "assets/images/test_5.png",
                content: "MRC",
                category: "",
              ),
              const SizedBox(width: 12),
              CircleCard(
                imgUrl: "assets/images/test_3.png",
                content: "MRD",
                category: "",
              ),
              const SizedBox(width: 12),
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
          children: [
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
            SizedBox(width: 20),
            Expanded(
              child: ImageCard(
                imgUrl: "assets/images/test_2.png",
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

class MobileHomePage extends StatelessWidget {
  MobileHomePage({Key? key}) : super(key: key);

  final HomePageController controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(LocaleKeys.home_title.tr),
        titleTextStyle: Get.textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w900,
          color: const Color(0xff1e299c),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              popular(),
              const SizedBox(height: 50),
              trendingCollection(),
              const SizedBox(height: 50),
              today(),
            ],
          ),
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
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: TodayCard(
                    content: "KOOFA ZOO",
                    imgUrl: "assets/images/test_6.png",
                    category: "")),
            SizedBox(width: 20),
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
            children: [
              CircleCard(
                imgUrl: "assets/images/test_3.png",
                content: "MRA",
                category: "",
              ),
              const SizedBox(width: 12),
              CircleCard(
                imgUrl: "assets/images/test_4.png",
                content: "MRB",
                category: "",
              ),
              const SizedBox(width: 12),
              CircleCard(
                imgUrl: "assets/images/test_5.png",
                content: "MRC",
                category: "",
              ),
              const SizedBox(width: 12),
              CircleCard(
                imgUrl: "assets/images/test_3.png",
                content: "MRD",
                category: "",
              ),
              const SizedBox(width: 12),
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
          children: [
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
