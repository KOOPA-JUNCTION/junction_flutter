import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class CircleCard extends StatelessWidget {
  const CircleCard({
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
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.asset(imgUrl),
          ),
          Text(
            content,
            style: AppTextTheme.medium12,
          )
        ]);
  }
}
