import 'package:camera/camera.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/layout/adaptive.dart';
import 'package:firebase_getx_boilerplate/app/pages/market/controller.dart';
import 'package:firebase_getx_boilerplate/app/pages/market/widget/option.dart';
import 'package:firebase_getx_boilerplate/app/pages/market/widget/result.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:firebase_getx_boilerplate/app/widgets/textfield.dart';
import 'package:firebase_getx_boilerplate/generated/locales.g.dart';
import 'package:flutter/material.dart';

import "dart:js" as js;

import 'package:get/get.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({Key? key}) : super(key: key);

  //var state = js.JsObject.fromBrowserObject(js.context['state']);
  //print(state['hello']);

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    if (isDesktop) return DesktopMarketPage();
    return MobileMarketPage();
  }
}

class DesktopMarketPage extends StatelessWidget {
  DesktopMarketPage({Key? key}) : super(key: key);

  final MarketPageController controller = Get.find<MarketPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FGBPTextField(
              textController: controller.search,
              hintText: "검색할 사진 이름 또는 #해시태그를 입력하세요",
            ),
            const SizedBox(height: 14),
            Row(
              children: const [
                SearchOption(content: "카테고리 명"),
                SearchOption(content: "카테고리 명"),
                SearchOption(content: "카테고리 명"),
                SearchOption(content: "카테고리 명"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "인기순",
                  style: AppTextTheme.medium12,
                ),
              ],
            ),
            GridView.builder(
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                childAspectRatio: 1 / 2, //item 의 가로 1, 세로 2 의 비율
                mainAxisSpacing: 10, //수평 Padding
                crossAxisSpacing: 10, //수직 Padding
              ),
              itemBuilder: (BuildContext context, int index) {
                return const SearchResult(
                    category: "풍경",
                    content: "광안리",
                    imgUrl: "assets/images/test_busan.dart",
                    coin: "0.039");
              },
            )
          ],
        ),
      )),
    );
  }
}

class MobileMarketPage extends StatelessWidget {
  MobileMarketPage({Key? key}) : super(key: key);

  final MarketPageController controller = Get.find<MarketPageController>();

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
