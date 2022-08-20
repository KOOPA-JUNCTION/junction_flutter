import 'package:firebase_getx_boilerplate/app/data/initalize.dart';
import 'package:firebase_getx_boilerplate/app/routes/pages.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:firebase_getx_boilerplate/app/translation/translation.dart';
import 'package:firebase_getx_boilerplate/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';
//import 'package:url_strategy/url_strategy.dart';

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
  //setPathUrlStrategy();
  runApp(GetMaterialApp(
    initialRoute: Routes.root,
    getPages: AppPages.pages,
    theme: ThemeData(fontFamily: "Pretendard"),
    locale: GetCurrentLocale.currentDeviceLocale,
    translationsKeys: AppTranslation.translations,
    fallbackLocale: GetCurrentLocale.fallBackLocale,
  ));
}
