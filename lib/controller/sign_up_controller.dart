import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

   GlobalKey<FormState> signUpFormKey = GlobalKey() ;
   TextEditingController usernameController = TextEditingController() ;
   TextEditingController emailController = TextEditingController() ;
   TextEditingController passwordController = TextEditingController() ;
   TextEditingController passwordConfirmController = TextEditingController() ;
}
