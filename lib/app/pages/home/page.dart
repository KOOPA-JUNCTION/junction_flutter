import 'package:firebase_getx_boilerplate/app/pages/home/controller.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:firebase_getx_boilerplate/app/widgets/dropzone.dart';
import 'package:flutter/material.dart';

import "dart:js" as js;

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  //var state = js.JsObject.fromBrowserObject(js.context['state']);
  //print(state['hello']);

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
            SizedBox(
              width: 100,
              height: 100,
              child: DropZoneWidget(onDroppedFile: controller.onDroppedFile),
            )
          ],
        ),
      )),
    );
  }
}
