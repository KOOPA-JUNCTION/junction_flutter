import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/data/controllers/detail/controller.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchBuyView extends StatelessWidget {
  SearchBuyView({Key? key}) : super(key: key);

  final DetailImageController detailController =
      Get.find<DetailImageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Detail",
            style: AppTextTheme.bold16,
          ),
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(detailController.imgUrl.value, height: 160),
                        const SizedBox(width: 16),
                        Column(children: [
                          Text(detailController.name.value,
                              style: AppTextTheme.bold26),
                          const Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "Owned by",
                                style: AppTextTheme.regular12),
                            TextSpan(
                                text: "Ja_Hoon_05",
                                style: AppTextTheme.regularMain12),
                          ])),
                        ]),
                      ],
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColorTheme.grey),
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 23, horizontal: 19),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/ethereum.png"),
                                  const SizedBox(width: 8),
                                  const Text("ETH",
                                      style: AppTextTheme.medium18)
                                ],
                              ),
                              const Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "0.039",
                                    style: AppTextTheme.regular20),
                                TextSpan(
                                    text: "(\$63.64)",
                                    style: AppTextTheme.regularGrey10),
                              ])),
                            ],
                          ),
                        )),
                    Container(
                        decoration: BoxDecoration(
                          color: AppColorTheme.mainColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset("assets/icons/down.svg"),
                        )),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColorTheme.grey),
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 23, horizontal: 19),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/aurora.png"),
                                  const SizedBox(width: 8),
                                  const Text("AURORA",
                                      style: AppTextTheme.medium18)
                                ],
                              ),
                              const Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "10.39",
                                    style: AppTextTheme.regular20),
                                TextSpan(
                                    text: "(\$63.64)",
                                    style: AppTextTheme.regularGrey10),
                              ])),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              FGBPButton(
                  radius: 16,
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/buy.svg"),
                        const SizedBox(width: 8),
                        const Text(
                          "Buy Now",
                          style: AppTextTheme.semiboldWhite16,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
