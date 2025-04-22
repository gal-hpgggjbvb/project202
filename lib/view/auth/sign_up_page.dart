import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project2/view/auth/sign_in_page.dart';

import '../home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool _obscureText = true ;
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    return Scaffold(
      //for keyboard when shows up
      //resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //todo
                SizedBox(
                  child: Lottie.asset("images/Animation - 1729504255945.json"),
                ) ,
                const Text("Hello.." , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.w600),) ,
                const Text("Let's Make a New Account" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.w400),) ,
                const SizedBox(height: 12,) ,
                TextField(
                  controller: usernamecontroller,
                  decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)
                      ),
                      hintText: "Your Name"),
                  maxLength: 20,
                  onChanged: (val){},
                ) ,
                TextField(
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)
                      ),
                      hintText: "Your Email"),
                  onChanged: (val){},
                ) ,
                const SizedBox(height: 25,) ,
                TextField(
                  controller: passwordcontroller,
                  obscureText: _obscureText,
                  maxLength: 20,
                  decoration: InputDecoration(
                      focusColor: Colors.red ,
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)
                      ),
                      hintText: "Your Password" ,
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText? Icons.visibility : Icons.visibility_off) ,
                        onPressed: (){
                          _obscureText = !_obscureText ;
                          setState(() { });
                        },)
                  ),
                  onChanged: (val){},
                ) ,
                const SizedBox(height: 20,) ,
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(onPressed: (){
                        Get.to(() => HomePage()) ;
                      },
                        color: Colors.blue,
                        child: const Text("SignUp", style: TextStyle(
                            color: Colors.white,
                            fontSize: 20 , fontWeight: FontWeight.w400),),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already Have An Account?", style: TextStyle(
                      //color: Colors.white,fontSize: 25 , fontWeight: FontWeight.w600
                    ),
                    ),
                    TextButton(onPressed: (){
                      Get.to(() => const SignInPage()) ;
                    },
                      child: const Text("Sign In", style: TextStyle(
                        color: Colors.blue,
                      ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

      ),
    ) ;
  }
}


// Scaffold(
// backgroundColor: Colors.white,
// body: Column(
// children: [
// SizedBox(
// height: height * 0.045,
// width: width,
// ),
// SizedBox(
// height: height * 0.26,
// width: width * 0.55,
// child: Image.asset(
// 'images/assets/signupuser.png',
// fit: BoxFit.fill,
// ),
// ),
// Expanded(
// child: Container(
// margin: EdgeInsets.only(left: 10, right: 10),
// child: SingleChildScrollView(
// child:  Column(
// children: [
// Column(
// children: [
// Container(
// margin: const EdgeInsets.fromLTRB(1, 0, 1, 0),
// alignment: Alignment.topLeft,
// child: Text(
// 'Hello',
// style: TextStyle(
// fontSize: 60,
// fontWeight: FontWeight.bold,
// color: Colors.blue),
// )),
// Container(
// margin: const EdgeInsets.only(top: 0),
// alignment: Alignment.topLeft,
// child: Text(
// ' create new account',
// style: TextStyle(fontSize: 18, color: Colors.grey),
// )),
// SizedBox(
// height: height * 0.03,
// ),
// Container(
// margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
// decoration: const BoxDecoration(
// borderRadius: BorderRadius.all(Radius.circular(35)),
// color: Colors.white,
// boxShadow: [
// BoxShadow(
// blurRadius: 6,
// color: Colors.grey,
// offset: Offset(1, 1),
// )
// ],
// border: Border()),
// child: TextFormField(
// //controller: nameController,
// style: TextStyle(color: Colors.blue),
// autovalidateMode: AutovalidateMode.onUserInteraction,
// decoration: InputDecoration(
// hintText: 'name',
// hintStyle: TextStyle(color: Color(0xFFccc7c5)),
// focusedBorder: OutlineInputBorder(
// borderRadius:
// BorderRadius.all(Radius.circular(35)),
// borderSide: BorderSide(
// color: Colors.white,
// width: 1,
// )),
// enabledBorder: OutlineInputBorder(
// borderRadius:
// BorderRadius.all(Radius.circular(35)),
// borderSide: BorderSide(
// color: Colors.white,
// width: 1,
// )),
// prefixIcon: Icon(
// Icons.account_circle,
// color: Color(0xFF89dad0),
// ),
// ),
// ),
// ),
// Container(
// margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
// decoration: const BoxDecoration(
// borderRadius: BorderRadius.all(Radius.circular(35)),
// color: Colors.white,
// boxShadow: [
// BoxShadow(
// blurRadius: 6,
// color: Colors.grey,
// offset: Offset(1, 1),
// )
// ],
// border: Border()),
// child: TextFormField(
// //controller: emailController,
// style: TextStyle(color: Colors.blue),
// autovalidateMode: AutovalidateMode.onUserInteraction,
// decoration: InputDecoration(
// hintText: 'email',
// hintStyle: TextStyle(color: Color(0xFFccc7c5)),
// focusedBorder: OutlineInputBorder(
// borderRadius:
// BorderRadius.all(Radius.circular(35)),
// borderSide: BorderSide(
// color: Colors.white,
// width: 1,
// )),
// enabledBorder: OutlineInputBorder(
// borderRadius:
// BorderRadius.all(Radius.circular(35)),
// borderSide: BorderSide(
// color: Colors.white,
// width: 1,
// )),
// prefixIcon: Icon(
// Icons.email,
// color: Color(0xFF89dad0),
// ),
// ),
// ),
// ),
// Container(
// margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
// decoration: const BoxDecoration(
// borderRadius: BorderRadius.all(Radius.circular(35)),
// color: Colors.white,
// boxShadow: [
// BoxShadow(
// blurRadius: 6,
// color: Colors.grey,
// offset: Offset(1, 1),
// )
// ],
// border: Border()),
// child: TextFormField(
// //controller: passwordController,
// autovalidateMode: AutovalidateMode.onUserInteraction,
// style: TextStyle(color:Colors.blue),
// obscureText: true,
// decoration: InputDecoration(
// hintText: 'password',
// hintStyle: TextStyle(color: Color(0xFFccc7c5)),
// focusedBorder: OutlineInputBorder(
// borderRadius:
// BorderRadius.all(Radius.circular(35)),
// borderSide: BorderSide(
// color: Colors.white,
// width: 1,
// )),
// enabledBorder: OutlineInputBorder(
// borderRadius:
// BorderRadius.all(Radius.circular(35)),
// borderSide: BorderSide(
// color: Colors.white,
// width: 1,
// )),
// prefixIcon: Padding(
// padding: EdgeInsets
//     .only(), // add padding to adjust icon
// child: Icon(
// Icons.password,
// color: Color(0xFF89dad0),
// ),
// ),
// ),
// ),
// ),
// SizedBox(
// height: 35,
// width: width,
// ),
// GestureDetector(
// onTap: () {
// //register_method(controller);
// },
// child: Container(
// height: 65,
// width: width * 0.46,
// decoration: BoxDecoration(
// color: Colors.blue,
// border:
// Border.all(width: 1, color: Colors.blue),
// borderRadius: BorderRadius.circular(35),
// ),
// child: Center(
// child: Text(
// 'Sign up ',
// style:
// TextStyle(fontSize: 28, color: Colors.white),
// ),
// ),
// ),
// ),
// SizedBox(
// width: width,
// height: 40,
// ),
// Container(
// alignment: Alignment.bottomCenter,
// margin: const EdgeInsets.only(bottom: 15),
// child: RichText(
// text: TextSpan(
// text: 'You have an account? ',
// style: const TextStyle(
// color: Colors.grey, fontSize: 16),
// children: [
// // TextSpan(
// //     recognizer: TapGestureRecognizer()
// //       ..onTap = () {
// //         print('tip');
// //         Get.to(() => SignInPage(),
// //             transition: Transition.fade);
// //       },
// //     text: 'SignIn '.tr,
// //     style: const TextStyle(
// //         color: Colors.black, fontSize: 18)),
// ],
// ),
// ),
// ),
// ],
// ),
// ],
// )
// ),
// ),
// ),
// ],
// )
// // : Center(
// //     child: CircularProgressIndicator(
// //       color: AppColors.mainColor,
// //       backgroundColor: Colors.white,
// //     ),
// //   );
// );