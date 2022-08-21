import 'package:firebase_getx_boilerplate/app/data/initalize.dart';
import 'package:firebase_getx_boilerplate/app/routes/pages.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:firebase_getx_boilerplate/app/translation/translation.dart';
import 'package:firebase_getx_boilerplate/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';
//import 'package:url_strategy/url_strategy.dart';

//https://medium.com/@kenaragorn/flutter-web-readiness-for-the-world-65a480d7c660
//get generate locales assets/locales

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // loading
  await AppInitalizer().init();
  FlutterNativeSplash.remove();

  // Do Firebase Initial Settings With Firebase CLI
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //setPathUrlStrategy();
  runApp(GetMaterialApp(
    initialRoute: Routes.login,
    getPages: AppPages.pages,
    theme: ThemeData(
      fontFamily: 'Pretendard',
      colorScheme: Get.theme.colorScheme.copyWith(
        primary: const Color(0xff1e299c),
        secondary: const Color(0xff1e299c),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFF5F5F5),
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      scaffoldBackgroundColor: Colors.white,
    ),
    locale: GetCurrentLocale.currentDeviceLocale,
    translationsKeys: AppTranslation.translations,
    fallbackLocale: GetCurrentLocale.fallBackLocale,
  ));
}
