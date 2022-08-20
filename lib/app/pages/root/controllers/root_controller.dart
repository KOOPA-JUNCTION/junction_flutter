import 'dart:math';

import 'package:firebase_getx_boilerplate/app/pages/home/binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/profile/binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/profile/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/search/bindings/search_binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/search/views/search_view.dart';
import 'package:firebase_getx_boilerplate/app/pages/stats/bindings/stats_binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/stats/views/stats_view.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RootController extends GetxController {
  final _navigatorKey = Random().nextInt(65535);
  late final navigatorKey = Get.nestedKey(_navigatorKey);
  final _pageIndex = 0.obs;
  int get pageIndex => _pageIndex.value;
  final _pages = [
    Routes.home,
    Routes.stats,
    '',
    Routes.search,
    Routes.profile,
  ];

  final centerOpened = false.obs;

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return GetPageRoute(
          transition: Transition.noTransition,
          settings: settings,
          page: () => const HomePage(),
          binding: HomePageBinding(),
        );
      case Routes.stats:
        return GetPageRoute(
          transition: Transition.noTransition,
          settings: settings,
          page: () => const StatsView(),
          binding: StatsBinding(),
        );
      case Routes.search:
        return GetPageRoute(
          transition: Transition.noTransition,
          settings: settings,
          page: () => const SearchView(),
          binding: SearchBinding(),
        );
      case Routes.profile:
        return GetPageRoute(
          transition: Transition.noTransition,
          settings: settings,
          page: () => const ProfileView(),
          binding: ProfilePageBinding(),
        );
      default:
        return GetPageRoute(settings: settings, page: () => Container());
    }
  }

  void changePage(int index) {
    if (_pageIndex.value == index) return;
    if (_pages[index] == '') return;
    _pageIndex(index);
    Get.offAllNamed(_pages[index], id: _navigatorKey);
  }

  void goToGetPhoto() async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result == null) return;
    Get.toNamed(Routes.image_detail, arguments: {'file': result});
  }

  void goToGetCamera() async {
    final result = await ImagePicker().pickImage(source: ImageSource.camera);
    if (result == null) return;
    Get.toNamed(Routes.image_detail, arguments: {'file': result});
  }
}
