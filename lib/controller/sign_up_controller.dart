// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project2/api/api_consumer.dart';
// import 'package:project2/controller/sign_status.dart';
// import 'package:project2/model/errors/exceptions.dart';
//
// SignStatus signStatus = Get.put(SignStatus());
//
// class SignUpController extends GetxController {
//   final ApiConsumer api;
//
//   SignUpController({required this.api});
//
//   //sign up form key
//   GlobalKey<FormState> signUpFormKey = GlobalKey();
//
//   //sign up user name
//   TextEditingController usernameController = TextEditingController();
//
//   //sign up user number
//   TextEditingController usernumberController = TextEditingController();
//
//   //sign up email
//   TextEditingController emailController = TextEditingController();
//
//   // sign up password
//   TextEditingController passwordController = TextEditingController();
//
//   //sign up confirm password
//   TextEditingController confirmPasswordController = TextEditingController();
//
//   signUp() async {
//     try {
//       signStatus.signLoading();
//       final response = await api.post(
//           // "https://food-api-omega.vercel.app/api/v1/user/signup",
//           "http://127.0.0.1:8000/api/register",
//           isFormData: true,
//           data: {
//             'name': usernameController.text,
//             'number': usernumberController,
//             'email': emailController.text,
//             'password': passwordController,
//             'confirmPassword': confirmPasswordController,
//           });
//       signStatus.signSuccess();
//     } on ServerExceptions catch (e) {
//       SignFailed(
//           status: e.errorModel.status, errorMessage: e.errorModel.error);
//       signStatus.signFailure();
//     }
//   }
// }
