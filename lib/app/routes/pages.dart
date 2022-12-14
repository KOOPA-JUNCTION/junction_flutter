import 'package:firebase_getx_boilerplate/app/core/middleware/login.dart';
import 'package:firebase_getx_boilerplate/app/pages/generate_nft/bindings/generate_nft_binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/generate_nft/views/generate_nft_view.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/image_detail/bindings/image_detail_binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/image_detail/views/image_detail_view.dart';
import 'package:firebase_getx_boilerplate/app/pages/login/binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/login/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/profile/binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/profile/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/root/bindings/root_binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/root/views/root_view.dart';
import 'package:firebase_getx_boilerplate/app/pages/search/bindings/search_binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/search/views/buy_view.dart';
import 'package:firebase_getx_boilerplate/app/pages/search/views/detail_view.dart';
import 'package:firebase_getx_boilerplate/app/pages/search/views/search_view.dart';
import 'package:firebase_getx_boilerplate/app/pages/stats/bindings/stats_binding.dart';
import 'package:firebase_getx_boilerplate/app/pages/stats/views/stats_view.dart';
import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomePageBinding(),
      middlewares: [LoginMiddleware(priority: 0)],
    ),
    GetPage(
      name: Routes.root,
      page: () => RootView(),
      binding: RootBinding(),
      middlewares: [LoginMiddleware(priority: 0)],
    ),
    GetPage(
      name: Routes.stats,
      page: () => const StatsView(),
      binding: StatsBinding(),
      middlewares: [LoginMiddleware(priority: 0)],
    ),
    GetPage(
      name: Routes.search,
      page: () => SearchView(),
      binding: SearchBinding(),
      middlewares: [LoginMiddleware(priority: 0)],
    ),
    GetPage(
      name: Routes.search_detail,
      page: () => SearchDetilView(),
      binding: SearchBinding(),
      middlewares: [LoginMiddleware(priority: 0)],
    ),
    GetPage(
      name: Routes.search_buy,
      page: () => SearchBuyView(),
      binding: SearchBinding(),
      middlewares: [LoginMiddleware(priority: 0)],
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileView(),
      binding: ProfilePageBinding(),
      middlewares: [LoginMiddleware(priority: 0)],
    ),
    GetPage(
      name: Routes.image_detail,
      page: () => const ImageDetailView(),
      binding: ImageDetailBinding(),
      middlewares: [LoginMiddleware(priority: 0)],
    ),
    GetPage(
      name: Routes.generate_nft,
      page: () => const GenerateNftView(),
      binding: GenerateNftBinding(),
      middlewares: [LoginMiddleware(priority: 0)],
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
