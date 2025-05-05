import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http ;
import 'package:project2/model/user_data.dart';
import 'package:project2/services/settings_services.dart';
import 'package:project2/view/auth/sign_in_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<UserData> users = [] ;

  SettingsServices controller = Get.put(SettingsServices()) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,),
      drawer:  Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                controller.sharedpref.clear() ;
                Get.off(() => const SignInPage()) ;
              },
              child: const Text("sign out"),
            ) ,
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
          itemBuilder: (context , index){
          final user = users[index] ;

          final email = user.email ;
          final nat = user.nat ;

        return ListTile(
          title: Text(nat),
          subtitle: Text(email),
          // leading: Image.network(photourl),
          leading: CircleAvatar(
              child: Text('${index+1}')),
          // trailing: Text(nat),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers ,
      ),
    );
  }
  void fetchUsers() async{
    print("fetch called") ;
    const url = "https://randomuser.me/api/?results=2" ;
    final uri = Uri.parse(url) ;
    final response = await http.get(uri) ;
    final body = response.body ;
    final json = jsonDecode(body) ;
    final results = json['results'] as List<dynamic> ;
    final transformed = results.map((e) {
      return UserData(
          nat: e['nat'],
          email: e['email'] ,
      ) ;
    }).toList() ;
    setState(() {
      users = transformed ;
    });
    print("fetch completed") ;
  }
}


// ListView.builder(
// itemCount: users.length,
// itemBuilder: (context, index) {
// final user = users[index] ;
// //final email = user['email'] ;
// final name = user['user']['name'] ;
// //final picture = user['picture']['large'] ;
// return ListTile(
// leading: CircleAvatar(child: Text('${index+1}')),
// title: Text('$name'),
// //subtitle: Text(email),
// //trailing: CircleAvatar(child: Image.network(picture),),
// ) ;
// },
// ),

// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage>{
//
//   final TextEditingController usernamecontroller = TextEditingController();
//   final TextEditingController emailcontroller = TextEditingController();
//   final TextEditingController passwordcontroller = TextEditingController();
//   bool _obscureText = true ;
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       //for the background photo to stay still
//       resizeToAvoidBottomInset: false,
//       // appBar: AppBar(
//       //   title: const Text("APP"),
//       //   centerTitle: true,
//       //   titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
//       //   backgroundColor: const Color(0xff22a3ff),
//       //   actions: const [],
//       // ),
//       body: Stack(
//         children: [
//           //first item in the stack
//           SizedBox(
//             width: width,
//             height: height,
//             child: Image.asset(
//               "images/pexels-brett.jpg",
//               fit: BoxFit.cover,
//             ),
//           ),
//           //second item in the stack
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: ListView(
//               children: [
//                 const SizedBox(height: 200,) ,
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(30),
//                   child: BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                     child: Container(
//                       //clipBehavior: Clip.none,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: Colors.white.withOpacity(0.2),
//                           border: Border.all(
//                             color: Colors.white.withOpacity(0.4),
//                             width: 2,
//                           )),
//                       width: width,
//                       child:  Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Column(
//                           children: [
//                              const Text("SignUp", style: TextStyle(
//                                 //color: Colors.white,
//                                 fontSize: 25 , fontWeight: FontWeight.w400),),
//                             //todo
//                             TextField(
//                               controller: usernamecontroller,
//                               decoration: const InputDecoration(
//                                 prefixIcon: Icon(Icons.person),
//                                   focusedBorder: UnderlineInputBorder(
//                                       borderSide: BorderSide(color: Colors.blue)
//                                   ),
//                                   hintText: "Your Name"),
//                               maxLength: 20,
//                               onChanged: (val){},
//                             ) ,
//                             //todo
//                             TextField(
//                               controller: emailcontroller,
//                               keyboardType: TextInputType.emailAddress,
//                               decoration: const InputDecoration(
//                                 prefixIcon: Icon(Icons.email),
//                                   focusedBorder: UnderlineInputBorder(
//                                       borderSide: BorderSide(color: Colors.blue)
//                                   ),
//                                   hintText: "Your Email"),
//                               onChanged: (val){},
//                             ) ,
//                             const SizedBox(height: 25,) ,
//                             //todo
//                             TextField(
//                               controller: passwordcontroller,
//                               obscureText: _obscureText,
//                               maxLength: 20,
//                               decoration: InputDecoration(
//                                 prefixIcon: const Icon(Icons.lock_outline),
//                                   focusColor: Colors.red ,
//                                   focusedBorder: const UnderlineInputBorder(
//                                       borderSide: BorderSide(color: Colors.blue)
//                                   ),
//                                   hintText: "Your Password" ,
//                                   suffixIcon: IconButton(
//                                     icon: Icon(_obscureText? Icons.visibility : Icons.visibility_off) ,
//                                     onPressed: (){
//                                       _obscureText = !_obscureText ;
//                                       setState(() { });
//                                     },)
//                               ),
//                               onChanged: (val){},
//                             ) ,
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 150,) ,
//                 Expanded(
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: MaterialButton(onPressed: (){
//                       //Get.to(() => HomePage()) ;
//                     },
//                       color: Colors.blue,
//                       child: const Text("SignUp", style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20 , fontWeight: FontWeight.w400),),
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text("Already Have An Account?", style: TextStyle(
//                       //color: Colors.white,fontSize: 25 , fontWeight: FontWeight.w600
//                     ),
//                     ),
//                     TextButton(onPressed: (){
//                       //Get.to(() => const SignInPage()) ;
//                     },
//                       child: const Text("Sign In", style: TextStyle(
//                         color: Colors.white,
//                       ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class BlurContainer extends StatelessWidget {
//   const BlurContainer({
//     Key? key,
//     this.containerHeight = 120,
//     this.child,
//   }) : super(key: key);
//
//   final double containerHeight;
//   final Widget? child;
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(15),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
//         child: Container(
//           clipBehavior: Clip.none,
//           height: containerHeight,
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.2),
//             border: Border.all(
//               color: Colors.white.withOpacity(0.5),
//               width: 1.5,
//             ),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           alignment: Alignment.center,
//           child: child,
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: const Center(
//         child: Text("HomePage") ,
//       ),
//     ) ;
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final TextEditingController _controller = TextEditingController();
//   bool _obscureText = true; // For toggling password visibility
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body:  Container(
//           padding: const EdgeInsets.symmetric(horizontal: 30),
//           child:  const Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 children: [
//                   Text("Let's Sign You In" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.w600),),
//                   Text("Welcome Back." , style: TextStyle(fontSize: 25),) ,
//                 ],
//               ) ,
//               SizedBox(height: 150,) ,
//               Text("Email" , style: TextStyle(fontWeight: FontWeight.w600),) ,
//               TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder() ,
//                   hintText: "Your Email" ,
//                 ),
//               ) ,
//               SizedBox(height: 20,) ,
//               Text("Password" , style: TextStyle(fontWeight: FontWeight.w600),) ,
//               TextField(
//                 controller: _controller,
//                 obscureText: _obscureText,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _obscureText ? Icons.visibility : Icons.visibility_off,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscureText = !_obscureText; // Toggle password visibility
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   //suffixIcon: IconButton(onPressed: (){}, icon: Icons.remove_red_eye),
//                     border: OutlineInputBorder() ,
//                     hintText: "Password"
//                 ),
//               ) ,
//             ],
//           ),
//         )
//     );
//   }
// }
