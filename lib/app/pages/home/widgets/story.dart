import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    Key? key,
    required this.category,
    required this.content,
    required this.imgUrl,
  }) : super(key: key);

  final String category;
  final String content;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(category, style: AppTextTheme.mediumMain12),
            Text(content, style: AppTextTheme.semibold16),
          ],
        ),
        Image.asset(imgUrl)
      ],
    );
  }
}
