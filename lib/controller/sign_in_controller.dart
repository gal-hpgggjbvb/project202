import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/api/api_consumer.dart';
import 'package:project2/api/end_points.dart';
import 'package:project2/controller/sign_status.dart';
import 'package:project2/model/sign_in_model.dart';

SignStatus signStatus = Get.put(SignStatus());

class SignInController extends GetxController {
  final ApiConsumer api;

  SignInController(this.api);

  //sign in form key
  GlobalKey<FormState> signInFormKey = GlobalKey();

  //sign in email
  TextEditingController emailController = TextEditingController();

  //sign in password
  TextEditingController passwordController = TextEditingController();

  SignInModel? user;

  signIn() async {
    try {
      // signStatus.signLoading();
      final response = await api.post("https://food-api-omega.vercel.app/api/v1/user/signin", data: {
        "email": emailController.text,
        "password": passwordController.text,
      });
      // print(response) ;
      signStatus.signSuccess();
    } catch (e) {
      signStatus.signFailure();
    }
  }
}

// signIn() async {
//   try {
//     // signStatus.signLoading();
//     final response = await Dio().post("https://food-api-omega.vercel.app/api/v1/user/signin", data: {
//       "email": emailController.text,
//       'password': passwordController.text,
//     });
//
//     print(response) ;
//     signStatus.signSuccess();
//   } catch (e) {
//     signStatus.signFailure();
//   }
// }


// signIn() async {
//   try {
//     // signStatus.signLoading();
//     final response = await api.post(EndPoint.signIn, data: {
//       ApiKey.email: emailController.text,
//       ApiKey.password: passwordController.text,
//     });
//     // print(response) ;
//     signStatus.signSuccess();
//   } catch (e) {
//     signStatus.signFailure();
//   }
// }