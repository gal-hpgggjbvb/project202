import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project2/custom_widgets/custom_setting_item.dart';
import 'package:project2/functions/add_space.dart';
import 'package:project2/view/auth/sign_in_page.dart';
import 'package:project2/view/settings/terms_page.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

import '../../cache/cache_helper.dart';
import '../../controller/theme_controller.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

bool activeDarkMode = false;
bool activeNotification = false;
// ThemeController themeController = Get.put(ThemeController());
late ThemeController themeController;

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    themeController = Get.put(ThemeController());
    super.initState();
  }

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
              Text(
                'Settings',
                style: TextStyle(
                  fontFamily: "Satoshi",
                  color: context.theme.colorScheme.onSecondary,
                  fontSize: 25,
                  fontWeight: FontWeight.bold, // typing style
                ),
              ),
              addVerticalSpace(40),
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
                  trackOutlineColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.orange; // when switch is ON
                    }
                    return Colors.black26; // when switch is OFF
                  }),
                  value: themeController.isDark,
                  onChanged: (val) {
                    themeController.isDark = val;
                    CacheHelper().saveData(key: 'isDark', value: val);
                    themeController.toggleTheme(val);
                    // print(val);
                    // print(CacheHelper().getData(key: 'isDark')) ;
                    // print('isDark settings  ${themeController.isDark}*********************************');
                    // print('isDark cache  ${CacheHelper().getData(key: 'isDark')}*********************************');
                    setState(() {});
                  },
                  // value: activeDarkMode,
                  // onChanged: (val) {
                  //   setState(() {
                  //     activeDarkMode = !activeDarkMode;
                  //     v ? v=false : v=true;
                  // });
                  // },
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
                  trackOutlineColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.orange; // when switch is ON
                    }
                    return Colors.black26; // when switch is OFF
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
              //todo contact
              CustomSettingItem(
                title: 'Contact Us',
                icon: Icons.mail,
                iconColor: Colors.white,
                iconBackgroundColor: Colors.blue,
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.noHeader,
                    customHeader: const Icon(
                      Icons.email_outlined,
                      color: Colors.blue,
                      size: 70,
                    ),
                    animType: AnimType.topSlide,
                    dialogBorderRadius: BorderRadius.circular(20),
                    title: "Contact Us at :",
                    titleTextStyle: TextStyle(
                      fontFamily: "Satoshi",
                      color: context.theme.colorScheme.onSecondary,
                      fontSize: 17,
                      fontWeight: FontWeight.normal, // typing style
                    ),
                    desc: "deliverysupport@gmail.com",
                    descTextStyle: TextStyle(
                      fontFamily: "Satoshi",
                      color: context.theme.colorScheme.onSecondary,
                      fontSize: 17,
                      fontWeight: FontWeight.normal, // typing style
                    ),
                    btnOkText: "Copy Email",
                    btnCancelText: "Close",
                    buttonsTextStyle: const TextStyle(
                      fontFamily: "Satoshi",
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.normal, // typing style
                    ),
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {
                      Clipboard.setData(const ClipboardData(
                          text: "deliverysupport@gmail.com"));
                      Get.snackbar("Copied", "Support email copied");
                    },
                  ).show();
                },
              ),
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
                            customHeader: const Icon(Icons.logout,
                                color: Colors.red, size: 50),
                            animType: AnimType.bottomSlide,
                            title: 'Sign Out',
                            titleTextStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            desc:
                                'Are you sure you want to sign out?\nYou will need to sign in again.',
                            btnCancelText: "Cancel",
                            btnCancelOnPress: () {},
                            btnOkText: "Sign Out",
                            btnOkOnPress: () async {
                              await CacheHelper().clearData();
                              // await CacheHelper().removeData(key: 'signed'); // or just remove "signed", "token", etc.
                              // await CacheHelper().removeData(key: 'token'); // or just remove "signed", "token", etc.
                              Get.offAll(() =>
                                  const SignInPage()); // Replace with your auth page
                            },
                            btnOkColor: Colors.red,
                            btnCancelColor: Colors.orangeAccent)
                        .show();
                  }),
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
                            title: 'Delete Account!',
                            titleTextStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red),
                            desc:
                                'Are you sure you want to delete your account?\nAll your data will be deleted!.',
                            btnCancelText: "Cancel",
                            btnCancelOnPress: () {},
                            btnOkText: "Delete Account",
                            btnOkOnPress: () async {
                              // Clear user session
                              //must be delete account from data base
                              await CacheHelper()
                                  .clearData(); // or just remove "signed", "token", etc.
                              Get.offAll(() =>
                                  const SignInPage()); // Replace with your auth page
                            },
                            btnOkColor: Colors.red,
                            btnCancelColor: Colors.orangeAccent)
                        .show();
                  }),
              // const SizedBox(height: 50,),
              //todo app version
              ListTile(
                title: Text(
                  'Version  1.0.0',
                  style: context.theme.textTheme.bodyMedium,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Divider(
                  height: 0,
                ),
              ),
              const Text(
                'Version  1.0.0',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
