import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project2/api/dio_consumer.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/controller/sign_in_controller.dart';
import 'package:project2/controller/sign_status.dart';
import 'package:project2/custom_widgets/custom_textformfield.dart';
import 'package:project2/view/auth/sign_up_page.dart';
import 'package:project2/view/hidden_drawer.dart';

// SignStatus signStatus = Get.put(SignStatus()) ;

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // SettingsServices controller = Get.put(SettingsServices());

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  bool _obscureText = true; // For toggling password visibility icon
  SignInController signInController =
      Get.put(SignInController(DioConsumer(dio: Dio())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //for keyboard when shows up
      resizeToAvoidBottomInset: true,
      //appBar: AppBar(),
      body:
          //   GetBuilder<SignInController>(
          //     init: SignInController(),
          // builder: (controller) =>
          Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
        ),
        //temper solution listview
        child: ListView(
          children: [
            SizedBox(
              // child: Lottie.asset("images/Animation - 1729504255945.json"),
              child: Image.asset("images/astronomy-1.jpg"),
            ),
            Form(
              key: signInController.signInFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(height: 30,) ,
                  const Text(
                    "Let's Sign You In",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    "Welcome Back.",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Email",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  CustomTextFormField(
                      controller: signInController.emailController,
                      textInputType: TextInputType.emailAddress,
                      hintText: 'Your Email'),

                  // const Text(
                  //   "Email",
                  //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  // ),
                  // //todo email text_field
                  // TextFormField(
                  //   controller: signInController.emailController,
                  //   keyboardType: TextInputType.emailAddress,
                  //   decoration: const InputDecoration(
                  //       focusedBorder: UnderlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.blue)),
                  //       hintText: "Your Email"),
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return "this field can't be empty";
                  //     }
                  //   },
                  // ),

                  const SizedBox(
                    height: 30,
                  ),

                  const Text(
                    "Password",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  //todo password text_field
                  TextFormField(
                    controller: signInController.passwordController,
                    obscureText: _obscureText,
                    // maxLength: 20,
                    decoration: InputDecoration(
                        focusColor: Colors.red,
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        hintText: "Your Password",
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            _obscureText = !_obscureText;
                            setState(() {});
                          },
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "this field can't be empty";
                      } else if (value.length < 8) {
                        return "password must be at least 8 characters";
                      }
                    },
                  ),

                  const SizedBox(
                    height: 150,
                  ),
                  //todo sign in button
                  Row(
                    children: [
                      Expanded(
                          child: GetBuilder<SignStatus>(
                        init: SignStatus(),
                        builder: (controller) {
                          return MaterialButton(
                            onPressed: () {
                              // controller.signSuccess() ;
                              // controller.signLoading() ;
                              // controller.signFailure() ;

                              //todo here the working two lines
                              // if(signInController.signInFormKey.currentState!.validate()){
                              //   signInController.signIn() ;
                              // }

                              if(signInController.signInFormKey.currentState!.validate()) {
                                Get.to(() => const HiddenDrawer());
                                CacheHelper()
                                    .saveData(key: 'signed', value: 'signed');
                                CacheHelper().saveData(
                                    key: 'email',
                                    value: signInController.emailController
                                        .text);
                                CacheHelper().saveData(
                                    key: 'password',
                                    value:
                                    signInController.passwordController.text);
                              }

                              // if(signInController.signInFormKey.currentState!.validate()){
                              //   //to keep in homepage when start again
                              //   controller.sharedpref.setString("id", "1") ;
                              //   Get.to(() => const HomePage()) ;
                              // }
                              // else{
                              //   print("not valid ***************************") ;
                              //   // print("${signInController.emailController}") ;
                              // }
                            },
                            color: Colors.blue,
                            padding: const EdgeInsets.all(5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: controller.loading == true
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "SignIn",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                          );
                        },
                      )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't Have An Account?",
                        style: TextStyle(
                            //color: Colors.white,fontSize: 25 , fontWeight: FontWeight.w600
                            ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const SignUpPage());
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Get.isSnackbarOpen ? controller.signLoading() : const Text("SignIn", style: TextStyle(
// color: Colors.white,
// fontSize: 20 , fontWeight: FontWeight.w400),),

// InkWell(
// onTap: (){
// Get.to(() => const HomePage()) ;
// },
// child: Container(
// width: MediaQuery.of(context).size.width,
// decoration:  BoxDecoration(
// borderRadius: BorderRadius.circular(12),
// gradient: const LinearGradient(
// begin: Alignment.topRight,
// end: Alignment.bottomLeft,
// colors: [
// Color(0xff014a80),
// Color(0xff3498db),
// ])),
// child: const Text("SignIn" ,
// textAlign: TextAlign.center,
// style: TextStyle(
// color: Colors.white,
// fontSize: 25 , fontWeight: FontWeight.w600),) ,
// ),
// ),

// TextField(
// controller: _controller,
// obscureText: _obscureText,
// decoration: InputDecoration(
// labelText: 'Password',
// border: OutlineInputBorder(),
// suffixIcon: IconButton(
// icon: Icon(
// _obscureText ? Icons.visibility : Icons.visibility_off,
// ),
// onPressed: () {
// setState(() {
// _obscureText = !_obscureText; // Toggle password visibility
// });
// },
// ),
// ),
// ),
// SizedBox(height: 20),
// ElevatedButton(
// onPressed: () {
// final inputText = _controller.text;
// ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(content: Text('You entered: $inputText')),
// );
// },
// child: Text('Submit'),
// ),
