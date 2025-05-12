
import 'package:get/get.dart';

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
    loading = false ;
    update() ;
    // final String errorMessage ;
    // Get.snackbar(
    //   "title Error",
    //   "message here",
    //   snackPosition: SnackPosition.BOTTOM,
    // );
  }

}

class SignFailed {
  final int status ;
  final String errorMessage ;

  SignFailed({required this.status , required this.errorMessage}){
    Get.snackbar(
      status.toString() ,
      errorMessage,
      snackPosition: SnackPosition.BOTTOM,
    );
    // update() ;
  }
}