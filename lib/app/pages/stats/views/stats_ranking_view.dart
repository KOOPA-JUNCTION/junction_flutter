import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/pages/stats/controllers/stats_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatsRankingView extends GetView<StatsController> {
  const StatsRankingView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    items: [
                      DropdownMenuItem(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.attachment),
                            Text('All categories', style: AppTextTheme.bold16),
                          ],
                        ),
                      )
                    ],
                    onChanged: (_) {},
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: DropdownButton<String>(
                    items: [
                      DropdownMenuItem(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.attachment),
                            Text('All chains'),
                          ],
                        ),
                      )
                    ],
                    onChanged: (_) {},
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xfffafafa),
          floating: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, index) => Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
                  child: Row(
                    children: [
                      Text('${index + 1}'),
                      const SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Bored Ape Yacht Club'),
                          SizedBox(height: 12),
                          Text(
                            '+ More',
                            style: TextStyle(color: Color(0xff7e7e7d)),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Column(
                        children: const [
                          Text('728.73'),
                          SizedBox(height: 8),
                          Text('47.8%'),
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(),
              ],
            ),
            childCount: 100,
          ),
        )
      ],
    );
  }
}
