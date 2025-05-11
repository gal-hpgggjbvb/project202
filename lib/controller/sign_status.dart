import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:project2/api/dio_consumer.dart';
import 'package:project2/controller/sign_in_controller.dart';

SignInController signInController = Get.put(SignInController(DioConsumer(dio: Dio()))) ;

class SignStatus extends GetxController {

  //late final String errorMessage ;
  bool loading = false ;
  signSuccess() {
    loading = false ;
    Get.snackbar("title Done", "message here");
    update() ;
  }

  signLoading() {
    loading = true ;
    update() ;
    // return CircularProgressIndicator() ;

    // if(loading){
    //   Get.defaultDialog(
    //     title: "",
    //     barrierDismissible: true,
    //     contentPadding: const EdgeInsets.only(bottom: 25),
    //     content: const SpinKitWave(
    //       color: Colors.green,
    //       size: 30,
    //     ),
    //   );
    // }

    // else if(loading == false){
    //   Get.back() ;
    // }

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
class SignFailed extends SignStatus{
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