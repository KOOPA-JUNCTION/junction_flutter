import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
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
          borderRadius: BorderRadius.circular(12),
          color: AppColorTheme.mainColor,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Image.asset(imgUrl),
                const SizedBox(height: 10),
                Text(title, style: AppTextTheme.semiboldWhite16),
                Text(content, style: AppTextTheme.semiboldWhite16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
