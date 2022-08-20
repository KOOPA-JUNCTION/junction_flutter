import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/data/controllers/image/controller.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/market/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/profile/page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation? rotationAnimation;

  final ImageController imageController = Get.find<ImageController>();

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController!);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController!);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController!);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController!, curve: Curves.easeOut));
    super.initState();
    animationController!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;

  void _onItemTapped(value) => setState(() {
        if (value == 2) {
          if (animationController!.isCompleted) {
            animationController!.reverse();
          } else {
            animationController!.forward();
          }
        } else {
          _selectedIndex = value;
        }
      });

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            widgetOptions.elementAt(_selectedIndex),
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  IgnorePointer(
                    child: Container(
                      color: Colors.transparent,
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(220),
                        degTwoTranslationAnimation!.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(rotationAnimation!.value))
                        ..scale(degTwoTranslationAnimation!.value),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: imageController.openImageFile,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColorTheme.mainColor,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(20),
                          child: const Icon(
                            Icons.image,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(320),
                        degThreeTranslationAnimation!.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(rotationAnimation!.value))
                        ..scale(degThreeTranslationAnimation!.value),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: imageController.openImageFile,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColorTheme.mainColor,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(20),
                          child: const Icon(
                            Icons.camera,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 5.0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColorTheme.white,
          selectedItemColor: AppColorTheme.mainColor,
          unselectedItemColor: AppColorTheme.grey,
          selectedLabelStyle: AppTextTheme.boldMain12,
          unselectedLabelStyle: AppTextTheme.boldSub12,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.stacked_bar_chart),
              label: 'Stat',
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: const BoxDecoration(
                  color: AppColorTheme.mainColor,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(20),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              label: "",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex, // 지정 인덱스로 이동
          onTap: _onItemTapped, // 선언했던 o
        ));
  }
}

List<Widget> widgetOptions = [
  const HomePage(),
  const MarketPage(),
  ProfileView()
];

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function()? onClick;

  CircularButton({
    required this.color,
    required this.width,
    required this.height,
    required this.icon,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
    );
  }
}
