import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/data/controllers/detail/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageCard extends StatelessWidget {
  ImageCard({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String imgUrl;
  final String title;
  final String content;

  final DetailImageController controller = Get.find<DetailImageController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.getToDetailView(imgUrl, content);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Image.network(imgUrl, fit: BoxFit.cover)),
              ],
            ),
            const SizedBox(height: 6),
            Text(title, style: AppTextTheme.medium16),
          ],
        ),
      ),
    );
  }
}
