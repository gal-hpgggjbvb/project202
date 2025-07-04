import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project2/api/dio_consumer.dart';
import 'package:project2/controller/order_controller.dart';
import 'package:project2/custom_widgets/custom_order_field.dart';
import 'package:project2/view/auth/sign_in_page.dart';

import '../cache/cache_helper.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  File? image;

  Future<void> pickImageFromGallery() async {
    final ImagePicker imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    // if(image == null) return ;

    // final imageTemporary = File(image!.path) ;
    setState(() {
      image = File(pickedFile!.path);
    });
  }

  OrderController orderController =
      Get.put(OrderController(DioConsumer(dio: Dio())));

  bool val = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //todo profile image
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.asset(
                    "images/4 - Copy.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  pickImageFromGallery();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                      height: 120,
                      width: 120,
                      child: image == null
                          ? Image.asset(
                              "images/4 - Copy.jpg",
                              fit: BoxFit.cover,
                            )
                          : Image.file(image!)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   CacheHelper().getData(key: 'name'),
                  //   style: const TextStyle(
                  //       fontSize: 20, fontWeight: FontWeight.w500),
                  // ),
                  Text(
                    '${CacheHelper().getData(key: 'name') ?? 'name here'} :<',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    'number : ${CacheHelper().getData(key: 'number') ?? 'name here'}',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    CacheHelper().getData(key: 'email') ?? 'name here',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              //todo sign-out button
              MaterialButton(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.red,
                onPressed: () {
                  // controller.sharedpref.clear();
                  CacheHelper().clearData();
                  // CacheHelper().saveData(key: 'signed', value: 2) ;
                  Get.offAll(() => const SignInPage());
                },
                child: const Text(
                  "sign out",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              //todo pick image button
              MaterialButton(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.green,
                onPressed: () {
                  pickImageFromGallery();
                },
                child: const Text(
                  "pick profile image",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Center(
                child: image == null
                    ? Text('data')
                    : Image.file(
                        image!,
                        height: 200,
                        width: 200,
                      ),
              ),
              MaterialButton(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.blue,
                onPressed: () {
                  print(CacheHelper().getData(key: 'name'));
                  print(CacheHelper().getData(key: 'number'));
                  print(CacheHelper().getData(key: 'email'));
                },
                child: const Text(
                  "sign out",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Center(
                child: MaterialButton(
                  onPressed: () async {
                    await CacheHelper().saveData(key: 'orderBool', value: true);
                    await orderController.makeOrder();
                  },
                  color: Colors.green,
                  child: const Text("Make an Order"),
                ),
                // GetBuilder<OrderController>(
                //   init: OrderController(DioConsumer(dio: Dio())),
                //   builder: (controller) {
                //     return MaterialButton(
                //       onPressed: () async {
                //         await orderController.makeOrder() ;
                //       },
                //       color: Colors.green,
                //       child: const Text("Make an Order"),
                //     ) ;
                //   },
                // ),
              ),
              MaterialButton(
                onPressed: () async {
                  print('_____________________________________________');
                  print(CacheHelper().getData(key: 'token'));
                  print('_____________________________________________');
                },
                color: Colors.green,
                child: const Text("print token "),
              ),
              MaterialButton(
                onPressed: () async {
                  val = !val;
                  CacheHelper().saveData(key: 'value', value: !val);
                },
                color: Colors.green,
                child: const Text("change value "),
              ),
              MaterialButton(
                onPressed: () async {
                  print(CacheHelper().getData(key: 'value'));
                },
                color: Colors.green,
                child: const Text("print value "),
              ),
              MaterialButton(
                onPressed: () async {
                  print(CacheHelper().getData(key: 'orderBool'));
                },
                color: Colors.green,
                child: const Text("print order bool "),
              ),

              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: false,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      builder: (context) => Center(
                            child: Form(
                              key: orderController.orderFormKey,
                              child: ListView(
                                padding: const EdgeInsets.all(30),
                                children: [
                                  const Center(child: Text('Make an Order')),
                                  const SizedBox(height: 15,) ,
                                  CustomOrderField(
                                    controller: orderController.objectNameController,
                                    hintText: 'type here',
                                    labelText: 'what do you want to deliver',
                                  ),
                                  CustomOrderField(
                                    controller: orderController.sourceController,
                                    hintText: 'type here',
                                    labelText: 'pickup location',
                                  ),
                                  CustomOrderField(
                                    controller: orderController.destinationController,
                                    hintText: 'type here',
                                    labelText: 'drop location',
                                  ),
                                  const SizedBox(height: 15,) ,
                                  //todo bottomsheet button
                                  Center(
                                    child: MaterialButton(
                                      onPressed: () async {
                                        // if(orderController.orderFormKey.currentState!.validate()){
                                        //   await CacheHelper().saveData(key: 'orderBool', value: true);
                                        //   await orderController.makeOrder();
                                        // }
                                        await CacheHelper().saveData(key: 'orderBool', value: true);
                                        await orderController.makeOrder();
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      color: Colors.blue[200],
                                      child: const Text("Make an Order"),
                                    ),
                                  ),
                                  const SizedBox(height: 400,) ,
                                  const Text('bottomsheet ends here')
                                ],
                              ),
                            ),
                          ));
                },
                child: const Text("show bottomsheet "),
              ),
              //todo another way
              const SizedBox(height: 90,) ,
              CustomOrderField(controller: orderController.objectNameController,
                  hintText: 'another way for order ui',
                  labelText: 'another way') ,

              MaterialButton(
                onPressed: () async {
                  print('status code is : =================${await CacheHelper().getData(key: 'responseStatusCode')}') ;
                  // showModalBottomSheet(
                  //     context: context,
                  //     builder: (context) => Container(
                  //           color: Colors.redAccent,
                  //           width: 100,
                  //           height: 100,
                  //         ));
                },
                color: Colors.greenAccent,
                child: const Text("show response status code "),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:project2/view/auth/sign_in_page.dart';
//
// import '../cache/cache_helper.dart';
// import '../custom_widgets/custom_card.dart';
//
// class UserPage extends StatefulWidget {
//   const UserPage({super.key});
//
//   @override
//   State<UserPage> createState() => _UserPageState();
// }
//
// class _UserPageState extends State<UserPage> {
//   File? image ;
//
//   Future<void> pickImageFromGallery() async {
//     final ImagePicker imagePicker = ImagePicker();
//     final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery) ;
//     // if(image == null) return ;
//
//     // final imageTemporary = File(image!.path) ;
//     setState(() {
//       image = File(pickedFile!.path) ;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//       ),
//       drawer: Drawer(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20, top: 40),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               //todo profile image
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(100),
//                 child: SizedBox(
//                   height: 120,
//                   width: 120,
//                   child: Image.asset(
//                     "images/4 - Copy.jpg",
//                     fit: BoxFit.cover,
//                   ) ,
//                 ) ,
//               ),
//               InkWell(
//                 onTap: (){
//                   pickImageFromGallery() ;
//                 },
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(100),
//                   child: SizedBox(
//                       height: 120,
//                       width: 120,
//                       child: image == null ? Image.asset("images/4 - Copy.jpg", fit: BoxFit.cover,) :
//                       Image.file(image!)
//                   ) ,
//                 ),
//               ),
//               const SizedBox(height: 20,),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     CacheHelper().getData(key: 'name'),
//                     style: const TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.w500),
//                   ),
//                   Text(
//                     CacheHelper().getData(key: 'email'),
//                     style: const TextStyle(fontSize: 15),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 30,),
//               //todo sign-out button
//               MaterialButton(
//                 shape: ContinuousRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 color: Colors.red,
//                 onPressed: () {
//                   // controller.sharedpref.clear();
//                   CacheHelper().clearData();
//                   // CacheHelper().saveData(key: 'signed', value: 2) ;
//                   Get.off(() => const SignInPage());
//                 },
//                 child: const Text(
//                   "sign out",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//
//               const SizedBox(height: 30,),
//               //todo pick image button
//               MaterialButton(
//                 shape: ContinuousRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 color: Colors.green,
//                 onPressed: () {
//                   pickImageFromGallery() ;
//                 },
//                 child: const Text(
//                   "pick profile image",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               Center(
//                 child: image == null ? Text('data') :
//                 Image.file(image! , height: 200, width: 200,),
//               ) ,
//             ],
//           ),
//         ),
//       ),
//       body: ListView.builder(
//           itemCount: 2,
//           itemBuilder: (context, itemCount) {
//             return CustomCard(
//               title: "Food",
//               image: "images/4 - Copy.jpg",
//             );
//           }),
//     );
//   }
// }
