import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/pages/home/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/market/page.dart';
import 'package:firebase_getx_boilerplate/app/pages/profile/page.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  void _onItemTapped(value) => setState(() {
        _selectedIndex = value;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 5.0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColorTheme.white,
          selectedItemColor: AppColorTheme.mainColor,
          unselectedItemColor: AppColorTheme.grey,
          selectedLabelStyle: AppTextTheme.boldMain12,
          unselectedLabelStyle: AppTextTheme.boldSub12,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '마켓',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: '마이',
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
  ProfilePage()
];
