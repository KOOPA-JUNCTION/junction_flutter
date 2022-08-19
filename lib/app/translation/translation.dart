import 'dart:ui';

import 'package:get/get.dart';

//Get.updateLocale(const Locale('ko', 'KR'))

abstract class GetCurrentLocale {
  static final currentDeviceLocale = Get.deviceLocale;
  static final currentLocale = Get.locale;
  static final currentSystemLocale = window.locale;
  static const fallBackLocale = Locale("en", "US");
}
