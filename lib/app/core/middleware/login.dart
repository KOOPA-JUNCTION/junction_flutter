import 'package:firebase_getx_boilerplate/app/pages/login/controller.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginMiddleware extends GetMiddleware {
  final LoginController loginController = Get.find<LoginController>();

  LoginMiddleware({super.priority});

  @override
  RouteSettings? redirect(String? route) {
    return loginController.isLogined
        ? null
        : RouteSettings(name: Routes.login, arguments: {'redirect': route});
  }
}
