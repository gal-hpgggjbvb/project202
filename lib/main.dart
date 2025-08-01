import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project2/bindings/main_binding.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/controller/lang/lang.dart';
import 'package:project2/controller/lang/lang_controller.dart';
import 'package:project2/controller/settings_controller.dart';
import 'package:project2/middleware/route_middleware.dart';
import 'package:project2/services/settings_services.dart';
import 'package:project2/theme/theme.dart';
import 'package:project2/view/auth/sign_in_page.dart';
import 'package:project2/view/auth/sign_up_page.dart';
import 'package:project2/view/hidden_drawer.dart';
import 'package:project2/view/home_page.dart';
import 'package:project2/view/intro_screen/intro_screen.dart';
import 'package:project2/view/splash_screen.dart';
import 'package:project2/view/user_view/user_page.dart';

import 'controller/theme_controller.dart';

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

  Get.put(ThemeController());
  Get.put(LangController());

  runApp( const MyApp());
  // runApp(GetBuilder<ThemeController>(
  //     init: ThemeController(),
  //     builder: (controller) =>
  //     const MyApp()));
}

// Future initServices() async {
//   // await Get.putAsync(() => CacheHelper().init()) ;
//   await Get.putAsync(() => SettingsServices().init());
// }
// ThemeController _themeController = ThemeController() ;

// ThemeController themeController = Get.put(ThemeController()) ;
final ThemeController themeController = Get.find();
final LangController langController = Get.find();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ///v3 theme working
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MainBinding(),
      ///theme
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeController.getThemeMode, // ✅ Works both on start and change

      ///localization
      // locale: Get.deviceLocale,
      locale: langController.iniLanguage,
      translations: Languages(),

      // home: const SignUpPage(),
      getPages: [
        GetPage(name: "/", page: () => const SplashScreen(),
          middlewares:  [
            RouteMiddleware(),
          ] ,binding: MainBinding(),
        ),
        GetPage(name: "/intro", page: () => const IntroScreen()),
        GetPage(name: "/signin", page: () => const SignInPage()),
        GetPage(name: "/signup", page: () => const SignUpPage()),
        // GetPage(name: "/home", page: () => const HomePage()),
        GetPage(name: "/user", page: () => const UserPage()),
        GetPage(name: "/drawer", page: () => const HiddenDrawer()),
      ],
    );

    ///v1
    // return GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: lightTheme,
    //   darkTheme: darkTheme,
    //   themeMode: _themeController.getThemeMode,
    //   // home: const SignUpPage(),
    //   getPages: [
    //     GetPage(name: "/", page: () => const SplashScreen(),
    //       middlewares:  [
    //         RouteMiddleware(),
    //       ] ,
    //     ),
    //     GetPage(name: "/intro", page: () => const IntroScreen()),
    //     GetPage(name: "/signin", page: () => const SignInPage()),
    //     GetPage(name: "/signup", page: () => const SignUpPage()),
    //     GetPage(name: "/home", page: () => const HomePage()),
    //     GetPage(name: "/user", page: () => const UserPage()),
    //     GetPage(name: "/drawer", page: () => const HiddenDrawer()),
    //   ],
    // );
    ///v2 theme working
    // return GetBuilder<ThemeController>(
    //   builder: (controller) {
    //     return GetMaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       ///theme
    //       theme: lightTheme,
    //       darkTheme: darkTheme,
    //       themeMode: controller.getThemeMode, // ✅ Works both on start and change
    //
    //       ///localization
    //       locale: Get.deviceLocale,
    //
    //       // home: const SignUpPage(),
    //       getPages: [
    //         GetPage(name: "/", page: () => const SplashScreen(),
    //           middlewares:  [
    //             RouteMiddleware(),
    //           ] ,
    //         ),
    //         GetPage(name: "/intro", page: () => const IntroScreen()),
    //         GetPage(name: "/signin", page: () => const SignInPage()),
    //         GetPage(name: "/signup", page: () => const SignUpPage()),
    //         // GetPage(name: "/home", page: () => const HomePage()),
    //         GetPage(name: "/user", page: () => const UserPage()),
    //         GetPage(name: "/drawer", page: () => const HiddenDrawer()),
    //       ],
    //     );
    //   },
    // );
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
