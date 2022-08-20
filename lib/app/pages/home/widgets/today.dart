import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class TodayCard extends StatelessWidget {
  const TodayCard({
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
    return Card(
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(imgUrl),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(),
                  const SizedBox(width: 4),
                  Column(
                    children: [
                      const Text("Owned by", style: AppTextTheme.medium8),
                      Text(content, style: AppTextTheme.bold12),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
