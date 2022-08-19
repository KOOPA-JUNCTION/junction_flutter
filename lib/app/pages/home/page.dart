import 'package:firebase_getx_boilerplate/app/layout/adaptive.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/controller.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:firebase_getx_boilerplate/app/widgets/dropzone.dart';
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
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FGBPTextButton(
                text: "Alert Message",
                radius: 10,
                onTap: () {
                  js.context.callMethod(
                      "alertMessage", ["Flutter is Calling upon JavaScript"]);
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: FGBPTextButton(
                text: "Loger",
                radius: 10,
                onTap: () {
                  js.context.callMethod('logger', ["flutterState"]);
                },
              ),
            ),
          ],
        ),
      )),
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
              text: "Alert Message",
              radius: 10,
              onTap: () {
                js.context.callMethod(
                    "alertMessage", ["Flutter is Calling upon JavaScript"]);
              },
            ),
            const SizedBox(height: 8),
            FGBPTextButton(
              text: "Loger",
              radius: 10,
              onTap: () {
                js.context.callMethod('logger', ["flutterState"]);
              },
            ),
          ],
        ),
      )),
    );
  }
}
