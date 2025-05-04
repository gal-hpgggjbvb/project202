import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project2/main.dart';
import 'package:project2/services/settings_services.dart';

class RouteMiddleware  extends GetMiddleware{

  SettingsServices controller = Get.put(SettingsServices()) ;
  @override
  RouteSettings? redirect(String? route){
    if (controller.sharedpref.getString("id") != null) {
      return const RouteSettings(name: "home") ;
    }
  }

}
