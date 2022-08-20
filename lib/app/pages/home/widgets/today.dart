import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/data/controllers/detail/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodayCard extends StatelessWidget {
  TodayCard({
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
      child: Card(
        elevation: 8,
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  imgUrl,
                  fit: BoxFit.cover,
                ),
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
      ),
    );
  }
}
