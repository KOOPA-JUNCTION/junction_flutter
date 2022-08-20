import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../controllers/search_controller.dart';

class _TitleContent extends StatelessWidget {
  final String title;
  final Widget child;
  const _TitleContent({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Get.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: const Color(0xff242424),
          ),
        ),
        const SizedBox(height: 14),
        child,
      ],
    );
  }
}

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.search_title.tr),
        titleTextStyle: Get.textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w900,
          color: const Color(0xff1e299c),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 90),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(36),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search),
                hintText: LocaleKeys.search_hintText.tr,
              ),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TitleContent(
                    title: LocaleKeys.search_allCategories.tr,
                    child: SizedBox(
                      height: 130,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => SizedBox(
                          width: 130,
                          height: 130,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(children: [
                              Container(color: Colors.red),
                              Positioned(
                                left: 16,
                                bottom: 16,
                                child: Text(
                                  '$index',
                                  style: Get.textTheme.headline6!.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ),
                        separatorBuilder: (_, index) =>
                            const SizedBox(width: 18),
                        itemCount: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TitleContent(
                    title: LocaleKeys.search_trending.tr,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 165,
                        childAspectRatio: 190 / 165,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 165,
                      ),
                      itemBuilder: (_, index) => searchItem(),
                      itemCount: 80,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchItem() {
    return GestureDetector(
      onTap: controller.moveToDetailView,
      child: SizedBox(
        width: 165,
        height: 190,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xfffafafa),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.2),
                blurRadius: 4,
              ),
            ],
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Container(
                      height: 106,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 26),
                  const Text(
                    'Jahoon Joo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        blurRadius: 4,
                      )
                    ],
                  ),
                  width: 40,
                  height: 40,
                ).marginOnly(top: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
