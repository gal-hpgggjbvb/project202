// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../cache/cache_helper.dart';
//
// class ThemeController extends GetxController {
//   RxBool isDark = false.obs;
//
//   @override
//   void onInit() {
//     // Load theme from storage (optional)
//     isDark.value = CacheHelper().getData(key: 'isDark') ?? false;
//     super.onInit();
//   }
//
//   // void toggleTheme(bool value) {
//   //   isDark.value = value;
//   //   Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
//   //   CacheHelper().saveData(key: 'isDark', value: value);
//   // }
//   void toggleTheme() {
//     isDark.value = !isDark.value;
//     Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
//     CacheHelper().saveData(key: 'isDark', value: isDark.value);
//   }
// }
//
// //todo light theme
// final light = ThemeData(
//   brightness: Brightness.light,
//   primaryColor: Colors.yellow,
//   scaffoldBackgroundColor: Colors.greenAccent,
//   bottomSheetTheme: BottomSheetThemeData(
//     backgroundColor: Colors.deepOrange[50],
//     elevation: 25,
//     shadowColor: Colors.purple,
//   ),
// ) ;
// //todo dark theme
// final dark =  ThemeData(
//   brightness: Brightness.dark,
//   primaryColor: Colors.blue,
//   scaffoldBackgroundColor: Colors.blueAccent,
//   bottomSheetTheme: BottomSheetThemeData(
//     backgroundColor: Colors.deepOrange[200],
//     elevation: 5,
//     shadowColor: Colors.green,
//   ),
// ) ;
