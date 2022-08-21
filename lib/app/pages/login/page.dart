import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/pages/login/controller.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';

class _ProfileButton extends StatelessWidget {
  final void Function()? onPress;
  final String name;
  final String id;
  const _ProfileButton({
    required this.onPress,
    required this.name,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPress,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Get.textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(id),
                  ],
                ),
                const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 40,
                  color: Color(0xff7e7e7d),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final LoginController loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                LocaleKeys.home_title.tr,
                style: AppTextTheme.extraboldMain40,
              ),
              const Text(
                "The easiest NFT Marketplace",
                style: AppTextTheme.medium20,
              ),
            ],
          ),
          Image.asset("assets/images/clip.png"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: FGBPTextButton(
                text: "Metamask Login", radius: 40, onTap: controller.login),
          )
        ],
      ),
    ));
  }
}
