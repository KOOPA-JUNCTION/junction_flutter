import 'package:accordion/accordion.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/pages/search/controllers/search_controller.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchDetilView extends GetView<SearchController> {
  const SearchDetilView({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Image.asset("assets/images/Dolphin.png"))
                      ],
                    ),
                    const SizedBox(height: 26),
                    const Text("김현준 침팬지", style: AppTextTheme.bold26),
                    const Text.rich(TextSpan(children: [
                      TextSpan(text: "Owned by", style: AppTextTheme.regular12),
                      TextSpan(
                          text: "Ja_Hoon_05",
                          style: AppTextTheme.regularMain12),
                    ])),
                    const SizedBox(height: 10),
                    Accordion(
                        paddingListHorizontal: 0,
                        paddingListBottom: 12,
                        contentBorderColor: AppColorTheme.grey,
                        children: [
                          AccordionSection(
                              headerBackgroundColor: AppColorTheme.grey,
                              header: Row(
                                children: [
                                  SvgPicture.asset("assets/icons/price.svg"),
                                  const SizedBox(width: 8),
                                  const Text("Price History",
                                      style: AppTextTheme.semibold14),
                                ],
                              ),
                              content: SizedBox()),
                          AccordionSection(
                              headerBackgroundColor: AppColorTheme.grey,
                              header: Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/icons/description.svg"),
                                  const SizedBox(width: 8),
                                  const Text("Description",
                                      style: AppTextTheme.semibold14),
                                ],
                              ),
                              content: SizedBox()),
                          AccordionSection(
                              headerBackgroundColor: AppColorTheme.grey,
                              header: Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/icons/description.svg"),
                                  const SizedBox(width: 8),
                                  const Text("Detail",
                                      style: AppTextTheme.semibold14),
                                ],
                              ),
                              content: SizedBox()),
                        ]),
                    Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Text("Current Price",
                                    style: AppTextTheme.regularGrey12),
                                Row(children: [
                                  Image.asset("assets/images/ethereum.png"),
                                  const Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text: "0.039",
                                        style: AppTextTheme.regular20),
                                    TextSpan(
                                        text: "(\$63.64)",
                                        style: AppTextTheme.regularGrey10),
                                  ])),
                                ]),
                              ],
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  color: AppColorTheme.mainColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                      "assets/icons/change.svg"),
                                )),
                            Column(
                              children: [
                                const Text("Current Price",
                                    style: AppTextTheme.regularGrey12),
                                Row(children: [
                                  Image.asset("assets/images/aurora.png"),
                                  const Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text: "0.039",
                                        style: AppTextTheme.regular20),
                                    TextSpan(
                                        text: "(\$63.64)",
                                        style: AppTextTheme.regularGrey10),
                                  ])),
                                ]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            FGBPButton(
                radius: 16,
                onTap: controller.moveToBuyView,
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
      ),
    );
  }
}
