import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class FGBPTextField extends StatelessWidget {
  const FGBPTextField(
      {Key? key,
      required this.textController,
      this.hintText,
      this.onPressed,
      this.inputType = TextInputType.none,
      this.borderColor = AppColorTheme.mainColor})
      : super(key: key);

  final TextEditingController textController;
  final String? hintText;
  final TextInputType? inputType;
  final Color borderColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: AppColorTheme.subColor,
      child: TextField(
        keyboardType: inputType,
        controller: textController,
        style: AppTextTheme.medium12,
        cursorColor: AppColorTheme.black,
        decoration: InputDecoration(
          prefix:
              IconButton(icon: const Icon(Icons.search), onPressed: onPressed),
          hintStyle: AppTextTheme.mediumSub12,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColorTheme.mainColor, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(50))),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColorTheme.white, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          fillColor: AppColorTheme.white,
          filled: true,
          hintText: hintText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
      ),
    );
  }
}
