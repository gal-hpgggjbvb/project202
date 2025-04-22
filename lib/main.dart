import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project2/view/splash_screen.dart';

void main() {
  // Lock the app to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
    runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: "Satoshi"),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen() ,
    );
  }
}

// class OnBoarding extends StatelessWidget{
//    OnBoarding({super.key});
//
//   final List<Introduction> list = [
//     Introduction(
//         imageUrl: "images/4 - Copy.jpg",
//         title: "title", subTitle: "subTitle") ,
//     Introduction(
//         imageUrl: "images/4 - Copy.jpg",
//         title: "title", subTitle: "subTitle") ,
//     Introduction(
//         imageUrl: "images/4 - Copy.jpg",
//         title: "title", subTitle: "subTitle") ,
//   ] ;
//   final List<Widget> list1 = [
//    Lottie.asset(
//    "images/Animation - 1729504255945.json" ,) ,
//     Lottie.asset(
//       "images/Animation - 1729504255945.json" ,) ,
//     Lottie.asset(
//       "images/Animation - 1729504255945.json" ,) ,
//   ] ;
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return IntroductionScreen(
//       rawPages: list1,
//       showDoneButton: false,
//       showBackButton: false,
//       showBottomPart: false,
//       showNextButton: false,
//       showSkipButton: false,
//     ) ;
//   }
// }
