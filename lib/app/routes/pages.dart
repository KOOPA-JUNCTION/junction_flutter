import 'package:firebase_getx_boilerplate/app/pages/detail/binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/market/binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/profile/binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/root.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        binding: HomePageBinding()),
    GetPage(name: Routes.root, page: () => RootPage(), bindings: [
      HomePageBinding(),
      DetailViewPageBinding(),
      MarketPageBinding(),
      ProfilePageBinding()
    ]),
  ];
}
