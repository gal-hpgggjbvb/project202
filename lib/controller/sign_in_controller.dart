import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:project2/api/api_consumer.dart';
import 'package:project2/api/end_points.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/controller/sign_status.dart';
import 'package:project2/model/errors/error_model.dart';
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

  SignInModel? user;
  ErrorModel? errorModel ;

  signIn() async {
    try {
      signStatus.signLoading();
      //todo change end point 10.0.2.2 for emulator chatgpt
      //todo check your internet connection
      final response = await api.post("http://10.0.2.2:8000/api/login",
      // final response = await api.post("http://127.0.0.1:8000/api/login",
          isFormData: true ,
          data: {
        "email": emailController.text,
        "password": passwordController.text,
      });

      user = SignInModel.fromJson(response) ;
      final decodedToken = JwtDecoder.decode(user!.token) ;
      CacheHelper().saveData(key: 'token', value: user!.token) ;
      CacheHelper().saveData(key: 'id', value: decodedToken['prv']) ;
      CacheHelper().saveData(key: 'name', value: decodedToken['name']) ;
      CacheHelper().saveData(key: 'phone', value: decodedToken['phone']) ;
      CacheHelper().saveData(key: 'email', value: decodedToken['email']) ;
      CacheHelper().saveData(key: 'role', value: decodedToken['role']) ;

      // final String v = CacheHelper().getData(key: 'id') ;
      // final String y = CacheHelper().getData(key: 'token') ;
      // print('ID is : $v') ;
      // print('token is : $y') ;
      // print(decodedToken['role']) ;
      // print(decodedToken['phone']) ;
      // print(decodedToken['email']) ;

      // print(response) ;
      // print('2*****************************************************') ;
      // print(CacheHelper().getData(key: 'token')) ;
      signStatus.signSuccess('signin successful' , 'welcome');
      CacheHelper().saveData(key: 'done', value: true) ;
      print('lookhereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee') ;
      print(CacheHelper().getData(key: 'done')) ;
      // Get.off(() => const Drawer()) ;
    }on ServerExceptions catch (e) {
      // print('error******************************************') ;
      // print(e.toString()) ;
      // signStatus.loading = false ;
      // SignFailed(errorMessage: e.errorModel.errorMessage);
      // SignFailed(status: e.errorModel.status,errorMessage: e.errorModel.message);
      SignFailed(errorMessage: e.errorModel.message);
      // print(CacheHelper().getData(key: 'status'));
      // print(CacheHelper().getData(key: 'message'));
       signStatus.signFailure();
      // update() ;
    }
  }



}
// signIn() async {
//   try {
//     // signStatus.signLoading();
//     print('============================================');
//     final response = await Dio().post("https://food-api-omega.vercel.app/api/v1/user/signin",
//         data: {
//           "email": emailController.text,
//           "password": passwordController.text,
//         });
//
//     print(response) ;
//     signStatus.signSuccess();
//   } catch (e) {
//     print(e.toString()) ;
//   }
// }


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

// signIn() async {
//   try {
//     // signStatus.signLoading();
//     final response = await api.post("https://food-api-omega.vercel.app/api/v1/user/signin", data: {
//       "email": emailController.text,
//       "password": passwordController.text,
//     });
//     user = SignInModel.fromJson(response) ;
//     final decodedToken = JwtDecoder.decode(user!.token) ;
//     CacheHelper().saveData(key: 'token', value: user!.token) ;
//     CacheHelper().saveData(key: 'id', value: decodedToken['id']) ;
//     final String v = CacheHelper().getData(key: 'id') ;
//     print('ID is : $v') ;
//     // print(response) ;
//     signStatus.signSuccess();
//   } on ServerExceptions catch (e) {
//     signStatus.signFailure();
//   }
// }

//complete version :

// signIn() async {
//   try {
//     // signStatus.signLoading();
//     final response = await api.post("https://food-api-omega.vercel.app/api/v1/user/signin", data: {
//       "email": emailController.text,
//       "password": passwordController.text,
//     });
//     user = SignInModel.fromJson(response) ;
//     final decodedToken = JwtDecoder.decode(user!.token) ;
//     CacheHelper().saveData(key: 'token', value: user!.token) ;
//     CacheHelper().saveData(key: 'id', value: decodedToken['id']) ;
//     final String v = CacheHelper().getData(key: 'id') ;
//     print('ID is : $v') ;
//     // print(response) ;
//     signStatus.signSuccess();
//   } on ServerExceptions catch (e) {
//     // SignFailed(errorMessage: e.errorModel.errorMessage);
//     SignFailed(status: e.errorModel.status,errorMessage: e.errorModel.errorMessage);
//     // signStatus.signFailure();
//   }
// }
// }