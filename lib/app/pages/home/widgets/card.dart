import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard(
      {Key? key, required this.imgUrl, required this.content, this.onTap})
      : super(key: key);

  final String imgUrl;
  final String content;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: AppColorTheme.mainColor,
      child: Center(
        child: Column(
          children: [
            Image.asset(imgUrl),
            const SizedBox(height: 10),
            Text(content, style: AppTextTheme.semiboldWhite16)
          ],
        ),
      ),
    );
  }
}
