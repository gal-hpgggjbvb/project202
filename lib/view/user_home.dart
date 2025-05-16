import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cache/cache_helper.dart';
import 'auth/sign_in_page.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                // controller.sharedpref.clear();
                CacheHelper().clearData();
                // CacheHelper().saveData(key: 'signed', value: 2) ;
                Get.off(() => const SignInPage());
              },
              child: const Text("sign out"),
            ),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, itemCount) {
            return Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,  //I assumed you want to occupy the entire space of the card
                    image: AssetImage(
                      'images/4 - Copy.jpg',
                    ),
                  ),
                ),
                child: ListTile(
                  leading: Text(
                    'Testing the ListTile',
                    style: TextStyle(color: Colors.white),
                  ),
                  title: Text(
                    'Testing again!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
