import 'package:get/get.dart';

class SignStatus extends GetxController{

  void signSuccess(){
    Get.showSnackbar(
      const GetSnackBar(
        title: "Done",
        duration: Duration(seconds: 3),
      )) ;
  }


}