import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class SearchOption extends StatelessWidget {
  const SearchOption({
    Key? key,
    required this.content,
    this.selected = false,
  }) : super(key: key);

  final String content;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: selected ? AppColorTheme.mainColor : AppColorTheme.black),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 13),
        child: Text(
          content,
          style: selected ? AppTextTheme.mediumMain12 : AppTextTheme.medium12,
        ),
      ),
    );
  }
}
