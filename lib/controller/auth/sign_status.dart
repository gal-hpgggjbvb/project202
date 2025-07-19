import 'package:get/get.dart';
import 'package:project2/cache/cache_helper.dart';

class SignStatus extends GetxController {
  //late final String errorMessage ;
  bool loading = false;

  // bool done = false ;
  signSuccess(String title, String message) {
    loading = false;
    // Get.snackbar("signin successful", "welcome");
    Get.snackbar(title, message);
    // done = true ;
    CacheHelper().saveData(key: 'signDone', value: true);
    update();
  }

  signLoading() {
    loading = true;
    update();
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
    loading = false;
    update();
    // final String errorMessage ;
    // Get.snackbar(
    //   "title Error",
    //   "message here",
    //   snackPosition: SnackPosition.BOTTOM,
    // );
  }
}

class SignFailed {
  final String errorMessage;

  SignFailed({required this.errorMessage}) {
    Get.snackbar(
      'signin failed: ',
      errorMessage,
      snackPosition: SnackPosition.BOTTOM,
    );
    // update() ;
  }
}
// class SignFailed {
//   final int status ;
//   final String errorMessage ;
//
//   SignFailed({required this.status , required this.errorMessage}){
//     Get.snackbar(
//       status.toString() ,
//       errorMessage,
//       snackPosition: SnackPosition.BOTTOM,
//     );
//     // update() ;
//   }
// }
