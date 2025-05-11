import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SignStatus extends GetxController {

  late final String errorMessage ;

  signSuccess() {
    Get.snackbar("title Done", "message here");
  }

  signLoading() {
    // return CircularProgressIndicator() ;

    Get.defaultDialog(
      title: "",
      barrierDismissible: true,
      contentPadding: const EdgeInsets.only(bottom: 25),
      content: const SpinKitWave(
        color: Colors.green,
        size: 30,
      ),
    );
  }

  signFailure() {
    // final String errorMessage ;
    Get.snackbar(
      "title Error",
      "message here",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
class SignFailed{
  final int status ;
  final String errorMessage ;

  SignFailed({required this.status , required this.errorMessage}){
    Get.snackbar(
      status.toString() ,
      errorMessage,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // signFailure() {
  //   // final String errorMessage ;
  //   Get.snackbar(
  //     "title Error",
  //     errorMessage,
  //     snackPosition: SnackPosition.BOTTOM,
  //   );
  // }

}