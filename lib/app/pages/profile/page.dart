import 'package:accordion/accordion.dart';
import 'package:camera/camera.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/layout/adaptive.dart';
import 'package:firebase_getx_boilerplate/app/pages/detail/controller.dart';
import 'package:firebase_getx_boilerplate/app/pages/market/controller.dart';
import 'package:firebase_getx_boilerplate/app/pages/market/widget/option.dart';
import 'package:firebase_getx_boilerplate/app/pages/market/widget/result.dart';
import 'package:firebase_getx_boilerplate/app/pages/profile/controller.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:firebase_getx_boilerplate/app/widgets/textfield.dart';
import 'package:firebase_getx_boilerplate/generated/locales.g.dart';
import 'package:flutter/material.dart';

import "dart:js" as js;

import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
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
    if (isDesktop)
      return DesktopProfilePage(
        category: category,
        content: content,
        imgUrl: imgUrl,
        owner: owner,
        coin: coin,
      );
    return MobileProfilePage();
  }
}

class DesktopProfilePage extends StatelessWidget {
  DesktopProfilePage({
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

  final ProfilePageController controller = Get.find<ProfilePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            header(),
            userCard(),
            Column(
              children: [
                Text("나의 자산", style: AppTextTheme.bold20),
              ],
            ),
            //DefaultTabController(length: length, child: child)
          ],
        ),
      )),
    );
  }

  Card userCard() {
    return Card(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(),
        IconButton(onPressed: () {}, icon: Icon(Icons.turn_right))
      ]),
    );
  }

  Row header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.alarm),
        )
      ],
    );
  }
}

class MobileProfilePage extends StatelessWidget {
  MobileProfilePage({Key? key}) : super(key: key);

  final ProfilePageController controller = Get.find<ProfilePageController>();

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
