import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/theme/theme.dart';

///v3
class ThemeController extends GetxController {
  late bool isDark;

  @override
  void onInit() {
    super.onInit();
    isDark = CacheHelper().getData(key: 'isDark') ?? false;
    // Apply saved theme on startup
    Get.changeThemeMode(getThemeMode);
  }

  ThemeMode get getThemeMode => isDark ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme(bool value) {
    isDark = value;
    CacheHelper().saveData(key: 'isDark', value: isDark);
    Get.changeThemeMode(getThemeMode); // ✅ This is what actually changes the mode
    update();
  }
}


///v2
// class ThemeController extends GetxController {
//   bool isDark = CacheHelper().getData(key: 'isDark') ?? false;
//   // late bool isDark ;
//
//   @override
//   void onInit() {
//     isDark = CacheHelper().getData(key: 'isDark') ?? false;
//     getThemeMode;
//     super.onInit();
//     update();
//   }
//   ThemeMode _themeMode = ThemeMode.light;
//   // ThemeMode _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
//
//   //to return theme mode in main
//   get getThemeMode => isDark ? ThemeMode.dark : ThemeMode.light;
//
//   toggleTheme(isDark) {
//     CacheHelper().saveData(key: 'isDark', value: isDark) ;
//     // print('isDark controller  $isDark*********************************');
//     // print('isDark controller cache $isDark*********************************');
//     // _themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
//     // isDark ? Get.changeTheme(lightTheme) : Get.changeTheme(darkTheme) ;
//     isDark ? Get.changeTheme(darkTheme) : Get.changeTheme(lightTheme) ;
//     // isDark = !isDark ;
//     // CacheHelper().saveData(key: 'isDark', value: isDark) ;
//     update();
//   }
// }

///v1
// class ThemeController extends GetxController {
//   // Make isDark reactive
//   RxBool isDark = false.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     bool savedTheme = CacheHelper().getData(key: 'isDark') ?? false;
//     isDark.value = savedTheme;
//     Get.changeThemeMode(savedTheme ? ThemeMode.dark : ThemeMode.light);
//   }
//
//   ThemeMode get themeMode => isDark.value ? ThemeMode.dark : ThemeMode.light;
//
//   void toggleTheme() {
//     isDark.value = !isDark.value;
//     CacheHelper().saveData(key: 'isDark', value: isDark.value);
//     Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
//   }
// }

