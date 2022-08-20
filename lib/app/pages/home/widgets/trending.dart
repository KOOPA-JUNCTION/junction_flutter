import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/data/controllers/detail/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleCard extends StatelessWidget {
  CircleCard({
    Key? key,
    required this.category,
    required this.content,
    required this.imgUrl,
  }) : super(key: key);

  final String category;
  final String content;
  final String imgUrl;

  final DetailImageController controller = Get.find<DetailImageController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.getToDetailView(imgUrl, content);
      },
      child: Column(
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
          ]),
    );
  }
}
