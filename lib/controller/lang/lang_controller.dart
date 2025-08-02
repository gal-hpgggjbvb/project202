import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/cache/cache_helper.dart';

class LangController extends GetxController {
  bool selectedLanguage = false;

  Locale iniLanguage = CacheHelper().getData(key: 'language') == null
      ? Get.deviceLocale!
      : Locale(CacheHelper().getData(key: 'language'));

  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    CacheHelper().saveData(key: 'language', value: langCode);
    Get.updateLocale(locale);
    update();
  }
  void deviceLang(){
    CacheHelper().removeData(key: 'language');
    Get.updateLocale(Get.deviceLocale!);
    update();
  }
}
