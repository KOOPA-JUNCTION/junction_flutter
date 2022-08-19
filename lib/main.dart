import 'package:firebase_getx_boilerplate/app/data/initalize.dart';
import 'package:firebase_getx_boilerplate/app/routes/pages.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:firebase_getx_boilerplate/app/translation/translation.dart';
import 'package:firebase_getx_boilerplate/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

//https://medium.com/@kenaragorn/flutter-web-readiness-for-the-world-65a480d7c660
//get generate locales assets/locales

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // loading
  // FlutterNativeSplash.remove(widgetsBinding: widgetsBinding);

  // Do Firebase Initial Settings With Firebase CLI
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppInitalizer().init();
  runApp(GetMaterialApp(
    initialRoute: Routes.home,
    getPages: AppPages.pages,
    theme: ThemeData(fontFamily: "Pretendard"),
    locale: GetCurrentLocale.currentDeviceLocale,
    translationsKeys: AppTranslation.translations,
    fallbackLocale: GetCurrentLocale.fallBackLocale,
  ));
}
