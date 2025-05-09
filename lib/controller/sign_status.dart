import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SignStatus extends GetxController {
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
    Get.snackbar(
      "title Error",
      "message here",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
