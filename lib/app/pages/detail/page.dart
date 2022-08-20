import 'package:camera/camera.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/layout/adaptive.dart';
import 'package:firebase_getx_boilerplate/app/pages/detail/controller.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:firebase_getx_boilerplate/generated/locales.g.dart';
import 'package:flutter/material.dart';

import "dart:js" as js;

import 'package:get/get.dart';

class DetailViewPage extends StatelessWidget {
  const DetailViewPage({
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
      return DesktopDetailViewPage(
        category: category,
        content: content,
        imgUrl: imgUrl,
        owner: owner,
        coin: coin,
      );
    }
    return MobileDetailViewPage();
  }
}

class DesktopDetailViewPage extends StatelessWidget {
  DesktopDetailViewPage({
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

  final DetailViewPageController controller =
      Get.find<DetailViewPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail", style: AppTextTheme.bold18),
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
            Expanded(child: Image.asset(imgUrl)),
            FGBPButton(
                child: Row(
              children: [
                const Text("Buy Now", style: AppTextTheme.semiboldWhite16)
              ],
            )),
          ],
        ),
      )),
    );
  }
}

class MobileDetailViewPage extends StatelessWidget {
  MobileDetailViewPage({Key? key}) : super(key: key);

  final DetailViewPageController controller =
      Get.find<DetailViewPageController>();

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
