import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsServices extends GetxService{

  //this variable to go to homepage or login page middleware
  late SharedPreferences sharedpref ;
  Future<SettingsServices> init() async{
    //start services
    sharedpref = await SharedPreferences.getInstance() ;
    //end
    return this ;
  }

}