import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:project2/api/api_consumer.dart';
import 'package:project2/controller/auth/sign_status.dart';
import 'package:project2/model/auth/sign_up_model.dart';
import 'package:project2/model/errors/exceptions.dart';
import 'package:project2/model/errors/sign_up_error_model.dart';

import '../../cache/cache_helper.dart';
import '../../model/errors/exception_2.dart';

SignStatus signStatus = Get.put(SignStatus());

class SignUpController extends GetxController {
  final ApiConsumer api;

  SignUpController({required this.api});

  //sign up form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  //sign up user name
  TextEditingController usernameController = TextEditingController();

  //sign up user number
  TextEditingController usernumberController = TextEditingController();

  //sign up email
  TextEditingController emailController = TextEditingController();

  // sign up password
  TextEditingController passwordController = TextEditingController();

  //sign up confirm password
  TextEditingController confirmPasswordController = TextEditingController();

  SignUpErrorModel? signUpErrorModel ;

  SignUpModel? user ;

  signUp() async {
    // print('************************trying**********');
    try {
      // signStatus.signLoading();
      final response = await api.post(
          // "https://food-api-omega.vercel.app/api/v1/user/signup",
          "http://10.0.2.2:8000/api/register",
          isFormData: true,
          data: {
            'name': usernameController.text,
            'phone': usernumberController.text,
            'email': emailController.text,
            'password': passwordController.text,
            'password_confirmation': confirmPasswordController.text,
            'role':'normal',
          });
      user = SignUpModel.fromJson(response) ;
      final decodedToken = JwtDecoder.decode(user!.token) ;
      CacheHelper().saveData(key: 'token', value: user!.token) ;
      CacheHelper().saveData(key: 'id', value: decodedToken['prv']) ;
      CacheHelper().saveData(key: 'name', value: decodedToken['name']) ;
      CacheHelper().saveData(key: 'phone', value: decodedToken['phone']) ;
      CacheHelper().saveData(key: 'email', value: decodedToken['email']) ;
      CacheHelper().saveData(key: 'role', value: decodedToken['role']) ;
      // print('**********response******************************');
      print(response) ;
      signStatus.signSuccess('sign up successfully', 'Welcome') ;
    } on ServerExceptions catch (e) {
      // print('**********error1******************************');
      // SignFailed(errorMessage: signUpErrorModel?.email ?? 'something');
      SignFailed(errorMessage: e.errorModel.message);
      // print('**********error2******************************');
      // print(e.toString()) ;
      // signStatus.signFailure();
    }
  }
}
