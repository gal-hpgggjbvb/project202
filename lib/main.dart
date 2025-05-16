import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/middleware/route_middleware.dart';
import 'package:project2/services/settings_services.dart';
import 'package:project2/view/home_page.dart';
import 'package:project2/view/splash_screen.dart';

void main() async {
  // Lock the app to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  //this for middleware
  WidgetsFlutterBinding.ensureInitialized();
  // await initServices();

  await CacheHelper().init() ;
  //to take one object of the class
  // await getIt<CacheHelper>().init() ;
  runApp(const MyApp());
}

// Future initServices() async {
//   // await Get.putAsync(() => CacheHelper().init()) ;
//   await Get.putAsync(() => SettingsServices().init());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: "Satoshi"),
      debugShowCheckedModeBanner: false,
      // home: const SplashScreen() ,
       initialRoute:CacheHelper().getData(key: 'signed') == 'signed' ? "/home" : "/",
      getPages: [
        GetPage(name: "/", page: () => const SplashScreen(),
            // middlewares:  [
          // RouteMiddleware(),]
        ),
        GetPage(name: "/home", page: () => const HomePage()),
      ],
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
