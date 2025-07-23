import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project2/api/dio_consumer.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/controller/auth/sign_in_controller.dart';
import 'package:project2/controller/auth/sign_status.dart';
import 'package:project2/custom_widgets/custom_textformfield.dart';
import 'package:project2/functions/add_space.dart';
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

  // bool _obscureText = true; // For toggling password visibility icon
  // SignInController signInController = Get.put(SignInController(DioConsumer(dio: Dio())));
  late SignInController signInController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    signInController = Get.put(SignInController(DioConsumer(dio: Dio())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //for keyboard when shows up
      resizeToAvoidBottomInset: true,
      //appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  //to take max width
                  width: double.infinity,
                  child: Lottie.asset("images/signin_orange_theme.json"),
                  // child: Image.asset("images/astronomy-1.jpg", fit: BoxFit.cover,),
                ),
                // const SizedBox(height: 20,),
                Form(
                  key: signInController.signInFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(height: 30,) ,
                      Text(
                        "Let's Sign You In",
                        style: TextStyle(
                            fontFamily: "Satoshi",
                            color: context.theme.primaryColorDark,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Welcome Back.",
                        style: TextStyle(
                            fontFamily: "Satoshi",
                            color: context.theme.primaryColorDark,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                      addVerticalSpace(20),
                      Text(
                        "Email",
                        style: TextStyle(
                            fontFamily: "Satoshi",
                            color: context.theme.primaryColorDark,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      //todo email field
                      CustomTextFormField(
                          controller: signInController.emailController,
                          textInputType: TextInputType.emailAddress,
                          hintText: 'Your Email'),

                      addVerticalSpace(30),

                      Text(
                        "Password",
                        style: TextStyle(
                            fontFamily: "Satoshi",
                            color: context.theme.primaryColorDark,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      //todo password text_field
                      CustomTextFormField(
                        controller: signInController.passwordController,
                        textInputType: TextInputType.visiblePassword,
                        hintText: 'Your Password',
                        isPassword: true,
                      ),
                      addVerticalSpace(30),

                      /// Role Dropdown
                      // DropdownButtonFormField<String>(
                      //   value: signInController.accountType,
                      //   items: ['Normal User', 'Delivery Man'].map((role) {
                      //     return DropdownMenuItem(
                      //       value: role,
                      //       child: Text(role),
                      //     );
                      //   }).toList(),
                      //   onChanged: (value) {
                      //     setState(() {
                      //       signInController.accountType = value;
                      //     });
                      //   },
                      //   // decoration: InputDecoration(
                      //   //   labelText: "Select Role",
                      //   //   border: UnderlineInputBorder(),
                      //   // ),
                      // ),
                      ///Radio to choose account type
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Signin as :',
                            style: TextStyle(
                              fontFamily: "Satoshi",
                              color: context.theme.colorScheme.onSecondary,
                              fontSize: 17,
                            ),
                          ),
                          Radio<String>(
                            value: 'user',
                            groupValue: signInController.accountType,
                            activeColor: context.theme.primaryColor,
                            autofocus: true,
                            // fillColor: MaterialStateProperty.resolveWith((states) {
                            //   if (states.contains(MaterialState.selected)) {
                            //     return Colors.green;
                            //   }
                            //   return Colors.grey;
                            // }),
                            onChanged: (value) => setState(
                                () => signInController.accountType = value!),
                          ),
                          Text(
                            'Normal User',
                            style: TextStyle(
                              fontFamily: "Satoshi",
                              color: context.theme.colorScheme.onSecondary,
                              fontSize: 15,
                            ),
                          ),
                          Radio<String>(
                            value: 'driver',
                            groupValue: signInController.accountType,
                            activeColor: context.theme.primaryColor,
                            onChanged: (value) => setState(
                                () => signInController.accountType = value!),
                          ),
                          Text(
                            'Delivery Man',
                            style: TextStyle(
                              fontFamily: "Satoshi",
                              color: context.theme.colorScheme.onSecondary,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),

                      addVerticalSpace(40),

                      ///todo sign in button
                      Row(
                        children: [
                          Expanded(
                            child: GetBuilder<SignStatus>(
                              init: SignStatus(),
                              builder: (controller) {
                                return MaterialButton(
                                  onPressed: () async {
                                    // controller.signSuccess() ;
                                    // controller.signLoading() ;
                                    // controller.signFailure() ;

                                    //todo here final code
                                    if (signInController
                                        .signInFormKey.currentState!
                                        .validate()) {
                                      CacheHelper().saveData(
                                          key: 'email',
                                          value:
                                              signInController.emailController.text);
                                      CacheHelper().saveData(
                                          key: 'password',
                                          value: signInController
                                              .passwordController.text);
                                      await signInController.signIn();
                                      if (CacheHelper()
                                          .getData(key: 'signDone')) {
                                        Future.delayed(
                                            const Duration(seconds: 2), () {
                                          CacheHelper().saveData(
                                              key: 'signed', value: true);
                                          CacheHelper().saveData(
                                              key: 'signDone', value: false);
                                          // controller.loading = true ;
                                          Get.offAll(
                                              () => const HiddenDrawer());
                                        });
                                      }
                                    }

                                    // Get.offAll(() => const HiddenDrawer());
                                  },
                                  // color: Colors.orange,
                                  color: context.theme.primaryColor,
                                  elevation: 10,
                                  height: 45,
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
                                              fontFamily: "Satoshi",
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                      // addVerticalSpace(5),
                      ///todo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't Have An Account?",
                            style: TextStyle(
                              fontFamily: "Satoshi",
                              color: context.theme.colorScheme.onSecondary,
                              fontSize: 15,
                              // fontWeight: FontWeight.w600
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(() => const SignUpPage());
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  fontFamily: "Satoshi",
                                  color: context.theme.primaryColor,
                                  fontWeight: FontWeight.bold),
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
