import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/custom_widgets/custom_setting_item.dart';
import 'package:project2/view/auth/sign_in_page.dart';
import 'package:project2/view/terms_page.dart';

import '../cache/cache_helper.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

bool activeDarkMode = false;
bool activeNotification = false;

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Settings',style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 25
              ),),
              const SizedBox(height: 40,),
              //todo change theme
              CustomSettingItem(
                icon: Icons.nightlight_round,
                iconBackgroundColor: Colors.grey.shade800,
                iconColor: Colors.white,
                title: 'Dark Mode',
                trailing: Switch(
                  activeColor: Colors.deepOrange,
                  inactiveThumbColor: Colors.orange,
                  inactiveTrackColor: Colors.white,
                  activeTrackColor: Colors.orange,
                  trackOutlineColor: MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.orange; // when switch is ON
                    }
                    return Colors.black26;  // when switch is OFF
                  }),
                  value: activeDarkMode,
                  onChanged: (val) {
                    setState(() {
                      activeDarkMode = !activeDarkMode;
                      //v ? v=false : v=true;
                    });
                  },
                ),
              ),
              //todo change language pop menu
              CustomSettingItem(
                  title: 'Change Language',
                  icon: Icons.language,
                  iconColor: Colors.white,
                iconBackgroundColor: Colors.teal.shade400,
              ),
              //todo notification
              CustomSettingItem(
                icon: Icons.notifications,
                iconBackgroundColor: Colors.deepPurple.shade300,
                iconColor: Colors.white,
                title: 'Notification',
                trailing: Switch(
                  activeColor: Colors.deepOrange,
                  inactiveThumbColor: Colors.orange,
                  inactiveTrackColor: Colors.white,
                  activeTrackColor: Colors.orange,
                  trackOutlineColor: MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.orange; // when switch is ON
                    }
                    return Colors.black26;  // when switch is OFF
                  }),
                  value: activeNotification,
                  onChanged: (val) {
                    setState(() {
                      activeNotification = !activeNotification;
                      //v ? v=false : v=true;
                    });
                  },
                ),
              ),
              //todo terms
              CustomSettingItem(
                title: 'Terms & Policy',
                icon: Icons.description,
                iconColor: Colors.white,
                // iconBackgroundColor: Colors.brown.shade400,
                iconBackgroundColor: Colors.green,
                onTap: () => Get.to(() => const TermsPage()),
              ),
              //todo delete account
              CustomSettingItem(
                title: 'Delete Account',
                icon: Icons.delete_forever,
                iconColor: Colors.white,
                iconBackgroundColor: Colors.red.shade900,
                onTap: () {
                    AwesomeDialog(
                      context: context,
                      // dialogType: DialogType.warning,
                      customHeader: const Icon(Icons.delete_forever,
                          color: Colors.red, size: 55),
                      animType: AnimType.bottomSlide,
                      title: 'Delete Account',
                      titleTextStyle: const TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,color: Colors.red),
                      desc: 'Are you sure you want to delete your account?\nAll your data will be deleted!.',
                      btnCancelText: "Cancel",
                      btnCancelOnPress: () {},
                      btnOkText: "Delete Account",
                      btnOkOnPress: () async {
                        // Clear user session
                        await CacheHelper().clearData(); // or just remove "signed", "token", etc.
                        Get.offAll(() => const SignInPage()); // Replace with your auth page
                      },
                      btnOkColor: Colors.red,
                      btnCancelColor: Colors.orangeAccent
                    ).show();
                  }),
              //todo sign out button
              CustomSettingItem(
                title: 'Sign Out',
                icon: Icons.logout,
                iconColor: Colors.white,
                iconBackgroundColor: Colors.red.shade500,
                  onTap: () {
                    AwesomeDialog(
                        context: context,
                        // dialogType: DialogType.warning,
                        customHeader: const Icon(Icons.logout, color: Colors.red, size: 50),
                        animType: AnimType.bottomSlide,
                        title: 'Sign Out',
                        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 20,),
                        desc: 'Are you sure you want to log out?\nYou will need to log in again.',
                        btnCancelText: "Cancel",
                        btnCancelOnPress: () {},
                        btnOkText: "Sign Out",
                        btnOkOnPress: () async {
                          await CacheHelper().removeData(key: 'signed'); // or just remove "signed", "token", etc.
                          await CacheHelper().removeData(key: 'token'); // or just remove "signed", "token", etc.
                          Get.offAll(() => const SignInPage()); // Replace with your auth page
                        },
                        btnOkColor: Colors.red,
                        btnCancelColor: Colors.orangeAccent
                    ).show();
                  }
              ),
              const SizedBox(height: 50,),
              //todo app version
              const Text('Version  1.0.0' , style: TextStyle(fontSize: 15),),

            ],
          ),
        ),
      ),
    ));
  }
}
