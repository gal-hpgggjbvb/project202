import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project2/view/intro_screen/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    //to hide system buttons
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(() => const IntroScreen()) ;
    });
  }

  @override
  void dispose() {
    super.dispose();
    //to return system buttons
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Color(0xff105ffc),
                  Color(0xffffffff),
                ])),
            //child: Lottie.asset(name),
          ),
          const Center(
              child: Text(
            "Welcome",
            style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: "Dancing_Script"),
          )),

        ],
      ),
    );
  }
}
