import 'package:firebase_getx_boilerplate/app/pages/stats/views/stats_activity_view.dart';
import 'package:firebase_getx_boilerplate/app/pages/stats/views/stats_ranking_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../controllers/stats_controller.dart';

class StatsView extends GetView<StatsController> {
  const StatsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.stats_title.tr),
          titleTextStyle: Get.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w900,
            color: const Color(0xff1e299c),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(
                icon: const Icon(Icons.bar_chart_outlined),
                text: LocaleKeys.stats_rankings.tr,
              ),
              Tab(
                icon: const Icon(Icons.trending_up),
                text: LocaleKeys.stats_activity.tr,
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          StatsRankingView(),
          StatsActivityView(),
        ]),
      ),
    );
  }
}
