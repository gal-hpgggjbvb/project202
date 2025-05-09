import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:project2/api/api_consumer.dart';
import 'package:project2/controller/sign_status.dart';
import 'package:project2/model/errors/exceptions.dart';
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

  SignInModel? user ;
  signIn() async {
    try {
      signStatus.signLoading();
      final rersponse = await api.post("path", data: {
        "email": emailController.text,
        'password': passwordController.text,
      });
      user = SignInModel.fromJson(rersponse) ;
      final tokenDecoded = JwtDecoder.decode(user!.token) ;
      print(tokenDecoded['id']) ;
      signStatus.signSuccess();
    } on ServerExceptions catch (e) {
      signStatus.signFailure();
    }
  }
}
