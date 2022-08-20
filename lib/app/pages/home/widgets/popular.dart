import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard(
      {Key? key,
      required this.imgUrl,
      required this.title,
      required this.content,
      this.onTap})
      : super(key: key);

  final String imgUrl;
  final String title;
  final String content;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Image.asset(imgUrl, fit: BoxFit.cover)),
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
