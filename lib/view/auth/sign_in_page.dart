import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project2/main.dart';
import 'package:project2/services/settings_services.dart';
import 'package:project2/view/auth/sign_up_page.dart';
import 'package:project2/view/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  SettingsServices controller = Get.put(SettingsServices()) ;
  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool _obscureText = true; // For toggling password visibility icon
  String? _email ;
  String? _password ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //for keyboard when shows up
      resizeToAvoidBottomInset: false,
      //appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xffffffff),
                      Color(0xff5d88de),
                    ])),
            //child: Lottie.asset(name),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0 , right: 15.0 , top: 50),
            //temper solution listview
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30,) ,
                    const Text("Let's Sign You In" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.w600),) ,
                    const Text("Welcome Back." , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.w500),) ,
                    const SizedBox(height: 70,) ,
                    const Text("Email" , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w600),) ,
                     //todo email text_field
                    TextField(
                      controller: emailcontroller,
                      decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)
                      ),
                      hintText: "Your Email"),
                    onChanged: (val){
                        _email = val ;
                    },
                    ) ,
                    const SizedBox(height: 30,) ,
                    const Text("Password" , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w600),) ,
                    //todo password text_field
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
                      onChanged: (val){
                        _password = val ;
                      },
                    ) ,
                    const SizedBox(height: 250,) ,
                    //todo sign in button
                    Row(
                      children: [
                        Expanded(
                          child: MaterialButton(onPressed: (){
                            Get.to(() =>  const HomePage()) ;
                            controller.sharedpref.setString("id", "1") ;
                          },
                            color: Colors.blue,
                            child: const Text("SignIn", style: TextStyle(
                                color: Colors.white,
                                fontSize: 20 , fontWeight: FontWeight.w400),),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't Have An Account?", style: TextStyle(
                            //color: Colors.white,fontSize: 25 , fontWeight: FontWeight.w600
                        ),
                        ),
                        TextButton(onPressed: (){
                          Get.to(() => const SignUpPage()) ;
                        },
                            child: const Text("Register", style: TextStyle(
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
        ],
      ),
    );
  }
}


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