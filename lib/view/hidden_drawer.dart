import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/view/delivery_man_view/delivery_man_page.dart';
import 'package:project2/view/home_page.dart';
import 'package:project2/view/notifications_page.dart';
import 'package:project2/view/settings_page.dart';
import 'package:project2/view/sign_out_page.dart';
import 'package:project2/view/profile_view/profile_page.dart';
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
      ///todo profile page
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Profile',
            baseStyle: const TextStyle(
              fontSize: 15,
            ),
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

      ///condition will be here
      // CacheHelper().getData(key: 'role') == 'normal' ?
      // CacheHelper().getData(key: 'role') != 'normal' ?

      ///todo main page user
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Main Page',
            baseStyle: const TextStyle(
              fontSize: 15,
            ),
            selectedStyle: const TextStyle(fontSize: 18),
            colorLineSelected: Colors.orange,
            // colorLineSelected: context.theme.primaryColor,
          ),
          const UserPage()), ///condition here:  :
      ///todo main page delivery man
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'Main Page Delivery Man',
              baseStyle: const TextStyle(
                fontSize: 15,
              ),
              selectedStyle: const TextStyle(fontSize: 18),
          colorLineSelected: Colors.orange,
          ),
          const DeliveryManPage()),


      ///todo notifications page
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Notifications',
            baseStyle: const TextStyle(
              fontSize: 15,
            ),
            selectedStyle: const TextStyle(fontSize: 18),
            colorLineSelected: Colors.orange,
            // colorLineSelected: context.theme.primaryColor,
          ),
          const NotificationsPage()),
      ///todo settings page
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Settings',
            baseStyle: const TextStyle(
              fontSize: 15,
            ),
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
      backgroundColorAppBar: context.theme.primaryColor,
      backgroundColorMenu: context.theme.primaryColorLight,

      screens: _pages,
      ///todo i will try use a condition here (normal/driver)
      initPositionSelected: 1,
      // disableAppBarDefault: false,
      slidePercent: 50,
      contentCornerRadius: 30,
      withAutoTittleName: false,
    );
  }
}
