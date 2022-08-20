import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    Key? key,
    required this.category,
    required this.content,
    required this.imgUrl,
    required this.coin,
  }) : super(key: key);

  final String category;
  final String content;
  final String imgUrl;
  final String coin;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imgUrl),
          Text(category, style: AppTextTheme.regularMain10),
          Row(
            children: [
              Text(content, style: AppTextTheme.semibold16),
              Row(
                children: [
                  Image.asset("asset/images/ethereum.png"),
                  Text(
                    coin,
                    style: AppTextTheme.regular10,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
