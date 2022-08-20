import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/widgets/platfomr_file_image_viewer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../controllers/generate_nft_controller.dart';

class GenerateNftView extends GetView<GenerateNftController> {
  const GenerateNftView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.generateNft_title.tr),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          padding: const EdgeInsets.all(8),
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
                          child: PlatformFileImageViewer(
                              file: controller.file.value!),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Text(
                          LocaleKeys.generateNft_name.tr,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 20),
                          child: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(16),
                            child: TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          LocaleKeys.generateNft_description.tr,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 20),
                          child: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(
                              children: [
                                TextFormField(
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  right: 12,
                                  bottom: 8,
                                  child: Text('0/100'),
                                )
                              ],
                            ),
                          ),
                        ),
                        Text(
                          LocaleKeys.generateNft_category.tr,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColorTheme.grey),
                              borderRadius: BorderRadius.circular(16)),
                          child: const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              "Add Category",
                              style: AppTextTheme.mediumGrey14,
                            ),
                          ),
                        ),
                        Text(
                          LocaleKeys.generateNft_blockchain.tr,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 20),
                          child: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(16),
                            child: DropdownButton(
                              items: controller.blockchainList
                                  .map((value) => DropdownMenuItem(
                                        child: Text(
                                          value,
                                        ),
                                        value: value,
                                      ))
                                  .toList(),
                              value: controller.selectedBlockchain.isNotEmpty
                                  ? controller.selectedBlockchain.value
                                  : null,
                              onChanged: controller.dropDownChanged,
                            ),
                          ),
                        ),
                        Text(
                          LocaleKeys.generateNft_startingPrice.tr,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 20),
                          child: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(16),
                            child: TextFormField(
                              decoration: InputDecoration(
                                suffix: const Text(".ETH",
                                    style: AppTextTheme.bold18),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: controller.goToGenerateNFT,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Text(LocaleKeys.imageDetail_create.tr),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
