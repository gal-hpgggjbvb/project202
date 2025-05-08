import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignStatus extends GetxController{

  signSuccess(){
    Get.snackbar("title Done", "message here") ;
  }
  signLoading(){
    const CircularProgressIndicator() ;
  }
  signFailure(){}

}