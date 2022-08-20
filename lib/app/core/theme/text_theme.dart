import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:flutter/material.dart';

abstract class AppTextTheme {
  //Default Black
  //Name Rule
  //FontWeight + Color + Font Size

  static const extraBold22 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w800,
      fontSize: 22,
      color: AppColorTheme.mainColor);

  static const boldSub12 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: AppColorTheme.subColor);
  static const boldMain12 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: AppColorTheme.mainColor);
  static const bold20 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: AppColorTheme.black);
  static const bold18 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: AppColorTheme.black);
  static const bold26 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w700,
      fontSize: 26,
      color: AppColorTheme.black);
  static const boldMain26 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w700,
      fontSize: 26,
      color: AppColorTheme.mainColor);

  static const regularMain10 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w400,
      fontSize: 10,
      color: AppColorTheme.mainColor);
  static const regular12 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w400,
      fontSize: 10,
      color: AppColorTheme.black);

  static const semiboldWhite16 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: AppColorTheme.white);
  static const semibold16 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: AppColorTheme.black);

  static const mediumSub12 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: AppColorTheme.subColor);
  static const mediumMain12 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: AppColorTheme.mainColor);
  static const medium12 = TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: AppColorTheme.black);
}
