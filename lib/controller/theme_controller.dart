import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/theme/theme.dart';

class ThemeController extends GetxController {
  bool isDark = CacheHelper().getData(key: 'isDark') ?? false;
  ThemeMode _themeMode = ThemeMode.light;
  // ThemeMode _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;

  //to return theme mode in main
  get getThemeMode => isDark ? ThemeMode.dark : ThemeMode.light;

  toggleTheme(isDark) {
    CacheHelper().saveData(key: 'isDark', value: isDark) ;
    // print('isDark controller  $isDark*********************************');
    // print('isDark controller cache $isDark*********************************');
    // _themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    // isDark ? Get.changeTheme(lightTheme) : Get.changeTheme(darkTheme) ;
    isDark ? Get.changeTheme(darkTheme) : Get.changeTheme(lightTheme) ;
    // isDark = !isDark ;
    // CacheHelper().saveData(key: 'isDark', value: isDark) ;
    update();
  }
}
