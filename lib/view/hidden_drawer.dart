import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:project2/view/home_page.dart';
import 'package:project2/view/settings_page.dart';
import 'package:project2/view/user_page.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'HomePage',
            baseStyle: TextStyle(),
            selectedStyle: TextStyle(),
          ),
          const HomePage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'UserPage',
            baseStyle: TextStyle(),
            selectedStyle: TextStyle(),
          ),
          const UserPage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Settings',
            baseStyle: TextStyle(),
            selectedStyle: TextStyle(),
          ),
          const SettingsPage()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
        backgroundColorMenu: Colors.white ,
        screens: _pages,
        initPositionSelected: 0,
      // disableAppBarDefault: false,
      slidePercent: 50,
      contentCornerRadius: 30,
      withAutoTittleName: false,
    );
  }
}
