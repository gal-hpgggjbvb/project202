import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:project2/view/home_page.dart';
import 'package:project2/view/notifications_page.dart';
import 'package:project2/view/user_view/profile_page.dart';
import 'package:project2/view/settings_page.dart';
import 'package:project2/view/sign_out_page.dart';
import 'package:project2/view/user_view/user_page.dart';

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
      //todo profile page
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Profile',
            baseStyle: const TextStyle(fontSize: 15,),
            selectedStyle: const TextStyle(fontSize: 18),
            colorLineSelected: Colors.orange,
            // colorLineSelected: context.theme.primaryColor,
          ),
          const ProfilePage()),
      // ScreenHiddenDrawer(
      //     ItemHiddenMenu(
      //       name: 'HomePage',
      //       baseStyle: TextStyle(fontSize: 15,),
      //       selectedStyle: TextStyle(fontSize: 18),
      //       colorLineSelected: Colors.orange,
      //     ),
      //     const HomePage()),
      //todo main page
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Main Page',
            baseStyle: const TextStyle(fontSize: 15,),
            selectedStyle: const TextStyle(fontSize: 18),
            colorLineSelected: Colors.orange,
            // colorLineSelected: context.theme.primaryColor,
          ),
          const UserPage()),
      //todo notifications page
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Notifications',
            baseStyle: const TextStyle(fontSize: 15,),
            selectedStyle: const TextStyle(fontSize: 18),
            colorLineSelected: Colors.orange,
            // colorLineSelected: context.theme.primaryColor,
          ),
          const NotificationsPage()),
      //todo settings page
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Settings',
            baseStyle: const TextStyle(fontSize: 15,),
            selectedStyle: const TextStyle(fontSize: 18),
            colorLineSelected: Colors.orange,
            // colorLineSelected: context.theme.primaryColor,
          ),
          const SettingsPage()),
      // ScreenHiddenDrawer(
      //     ItemHiddenMenu(
      //       name: 'Log Out',
      //       baseStyle: TextStyle(),
      //       selectedStyle: TextStyle(),
      //       colorLineSelected: Colors.orange,
      //     ),
      //     const SignOutPage()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      // backgroundColorAppBar: Colors.orange,
      // backgroundColorMenu: Colors.white,
      // backgroundColorAppBar: Theme.of(context).primaryColor,
      backgroundColorAppBar: context.theme.colorScheme.background,
      backgroundColorMenu: context.theme.colorScheme.onBackground,
        screens: _pages,
        //todo i will try use a condition here (normal/driver)
        initPositionSelected: 1,
      // disableAppBarDefault: false,
      slidePercent: 50,
      contentCornerRadius: 30,
      withAutoTittleName: false,
    );
  }
}
