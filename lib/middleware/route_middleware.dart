import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/services/settings_services.dart';

class RouteMiddleware  extends GetMiddleware{

  // SettingsServices controller = Get.put(SettingsServices()) ;
  late CacheHelper cacheHelper ;
  @override
  RouteSettings? redirect(String? route){
    // if (controller.sharedpref.getString("id") != null) {
    //   return const RouteSettings(name: "home") ;
    // }

    if (cacheHelper.getData(key: 'signed') == 'signed'){
      return const RouteSettings(name: "home") ;
    }


  }

}
