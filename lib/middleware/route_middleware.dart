import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project2/main.dart';

class RouteMiddleware  extends GetMiddleware{

  @override
  RouteSettings? redirect(String? route){
    if (sharedpref!.getString("id") != null) {
      return const RouteSettings(name: "home") ;
    }
  }

}
