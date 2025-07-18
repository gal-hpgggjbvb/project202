import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/theme/theme.dart';

class ThemeController extends GetxController {
  bool isDark = false;
  ThemeMode _themeMode = ThemeMode.light;

  get getThemeMode => _themeMode;

  toggleTheme(isDark) {
    CacheHelper().saveData(key: 'isDark', value: isDark) ;
    print('isDark controller  $isDark*********************************');
    print('isDark controller cache $isDark*********************************');
    // _themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    // isDark ? Get.changeTheme(lightTheme) : Get.changeTheme(darkTheme) ;
    isDark ? Get.changeTheme(darkTheme) : Get.changeTheme(lightTheme) ;
    // isDark = !isDark ;
    // CacheHelper().saveData(key: 'isDark', value: isDark) ;
    update();
  }
}
