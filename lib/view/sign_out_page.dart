// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project2/cache/cache_helper.dart';
// import 'package:project2/view/auth/sign_in_page.dart';
//
// class SignOutPage extends StatelessWidget {
//   const SignOutPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Are You Sure ?') ,
//             Text('all your data will be gone!') ,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
//               children: [
//                 TextButton(onPressed: (){
//                   CacheHelper().clearData();
//                   Get.off(() => SignInPage()) ;
//                 }, child: Text('yes')) ,
//                 TextButton(onPressed: (){}, child: Text('no')) ,
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
