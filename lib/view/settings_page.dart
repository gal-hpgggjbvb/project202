import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/view/auth/sign_in_page.dart';

import '../cache/cache_helper.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

bool activeDarkMode = false;

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: Colors.white,
              child: SwitchListTile(
                title: const Text("Dark Mode"),
                activeColor: Colors.lightBlue,
                inactiveThumbColor: Colors.red,
                inactiveTrackColor: Colors.tealAccent,
                value: activeDarkMode,
                onChanged: (val) {
                  setState(() {
                    activeDarkMode = !activeDarkMode;
                    //v ? v=false : v=true;
                  });
                },
              ),
            ),
            //todo pop menu
            Card(
              color: Colors.white,
              child: ListTile(
                onTap: () {},
                title: const Text('Change Language'),
              ),
            ),
            //todo sign out button
            Card(
              color: Colors.white,
              child: ListTile(
                onTap: () {
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          backgroundColor: Colors.white,
                          elevation: 10,
                          icon: const Icon(Icons.logout),
                          actionsAlignment: MainAxisAlignment.center,
                          // title: Text("Alert!"),
                          // titleTextStyle: TextStyle(),
                          content: const Text("Are You Sure?"),
                          contentTextStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                          contentPadding: EdgeInsets.only(top: 20 ,bottom: 20,left: 90 , ),
                          actionsPadding: EdgeInsets.all(1),
                          alignment: Alignment.center,
                          actions: [
                            TextButton(onPressed: () {
                              CacheHelper().clearData();
                              Get.offAll(() => const SignInPage());
                            },
                                child: const Text("Yes")),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("No")),
                          ],
                        );
                      });
                },
                title: const Text('Sign Out'),
              ),
            ),

            MaterialButton(
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.red,
              onPressed: () {
                // CacheHelper().clearData();
                // Get.off(() => const SignInPage());
              },
              child: const Text(
                "sign out",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
