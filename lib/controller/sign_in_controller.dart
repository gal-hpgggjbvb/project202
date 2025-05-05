import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{


  //sign in form key
  GlobalKey<FormState> signInFormKey = GlobalKey() ;
  //sign in email
  TextEditingController emailController = TextEditingController() ;
  //sign in password
  TextEditingController passwordController = TextEditingController() ;
}
