import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:project2/view/auth/sign_in_page.dart';
import 'package:project2/view/intro_screen/custom_intro_page.dart';

class IntroScreen extends StatefulWidget {
   const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

final _introkey = GlobalKey<IntroductionScreenState>() ;
final List<CustomIntroPage> introPages = [
  const CustomIntroPage(title: 'Title of introduction page', body: 'Welcome to this app', img: 'Animation - 1729504255945.json',) ,
  const CustomIntroPage(title: 'Title of introduction page', body: 'Welcome to this app', img: 'Animation - 1729504255945.json',) ,
  const CustomIntroPage(title: 'Title of introduction page', body: 'Welcome to this app', img: 'Animation - 1729504255945.json',) ,
] ;
class _IntroScreenState extends State<IntroScreen> {

  @override
  void initState(){
    super.initState();
    //to lock screen rotate
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]) ;
  }

  // @override
  // void dispose(){
  //   //to return rotation
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //     DeviceOrientation.landscapeLeft,
  //     DeviceOrientation.landscapeRight,
  //   ]) ;
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: IntroductionScreen(
            key: _introkey,
            rawPages: introPages ,
            showSkipButton: true,
            skip: const Text("Skip", style: TextStyle( color: Colors.blue,fontWeight: FontWeight.w700)),
            next: const Text("Next", style: TextStyle( color: Colors.blue,fontWeight: FontWeight.w700)),
            done: const Text("Done", style: TextStyle( color: Colors.blue,fontWeight: FontWeight.w700)),
            // On Done button pressed
            onDone: () {
              Get.to(() => const SignInPage()) ;
            },
            // On Skip button pressed
            onSkip: () {
              _introkey.currentState?.skipToEnd() ;
              setState(() {});
            },
            dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(30.0, 10.0),
              activeColor: const Color(0xff5BC6FF),
              color: Colors.black26,
              //space between dots
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0) ,
              ),
            ),
          ),
        )
    );
  }
}
//todo
// @override
// void initState(){
//   super.initState();
//   // Lock to portrait mode
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
// }
// @override
// void dispose() {
//   // Restore default orientations
//   SystemChrome.setPreferredOrientations(DeviceOrientation.values);
//   super.dispose();
// }

//todo
// class IntroScreen extends StatelessWidget {
//   IntroScreen({super.key});
//
//   final List<PageViewModel> introPages = [
//     PageViewModel(
//       title: "Title of introduction page",
//       body: "Welcome to the app! This is a description of how it works.",
//       image: const Center(
//         child: Icon(Icons.waving_hand, size: 50.0),
//       ),
//     ) ,
//     PageViewModel(
//       title: "Title of introduction page",
//       body: "Welcome to the app! This is a description of how it works.",
//       image: const Center(
//         child: Icon(Icons.waving_hand, size: 50.0),
//       ),
//     ) ,
//     PageViewModel(
//       title: "Title of introduction page",
//       body: "Welcome to the app! This is a description of how it works.",
//       image: const Center(
//         child: Icon(Icons.waving_hand, size: 50.0),
//       ),
//     ) ,
//   ] ;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body:IntroductionScreen(
//           pages: introPages,
//           showSkipButton: true,
//           skip: const Text("Skip"),
//           next: const Text("Next"),
//           done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
//           // On Done button pressed
//           onDone: () {},
//           // On Skip button pressed
//           onSkip: () {
//             introPages[0] = introPages[2] ;
//           },
//           dotsDecorator: DotsDecorator(
//             size: const Size.square(10.0),
//             activeSize: const Size(30.0, 10.0),
//             activeColor: const Color(0xff5BC6FF),
//             color: Colors.black26,
//             //space between dots
//             spacing: const EdgeInsets.symmetric(horizontal: 3.0),
//             activeShape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(25.0) ,
//             ),
//           ),
//         )
//     );
//   }
// }