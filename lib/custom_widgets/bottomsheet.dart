import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/api/dio_consumer.dart';
import 'package:project2/controller/user_controller/order_controller.dart';
import 'package:project2/custom_widgets/custom_order_field.dart';

import '../cache/cache_helper.dart';
import '../functions/add_space.dart';

OrderController orderController =
    Get.put(OrderController(DioConsumer(dio: Dio())));

void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SizedBox(
              //to control bottom sheet height
              height: MediaQuery.of(context).size.height * 0.50,
              child: Form(
                key: orderController.orderFormKey,
                child: ListView(
                  padding: const EdgeInsets.all(30),
                  children: [
                    const Center(child: Text('Make an Order')),
                    addVerticalSpace(15),
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
                    addVerticalSpace(15),
                    //todo bottomsheet button
                    Center(
                      child: MaterialButton(
                        onPressed: () async {
                          // if(orderController.orderFormKey.currentState!.validate()){
                          //   await CacheHelper().saveData(key: 'orderBool', value: true);
                          //   await orderController.makeOrder();
                          // }
                          await CacheHelper()
                              .saveData(key: 'sendToken', value: true);
                          await orderController.makeOrder();
                          // Get.back();
                          Navigator.pop(context);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.orange[200],
                        child: const Text("Make an Order"),
                      ),
                    ),
                    //todo bottomsheet button
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          // if(orderController.orderFormKey.currentState!.validate()){
                          //   await CacheHelper().saveData(key: 'orderBool', value: true);
                          //   await orderController.makeOrder();
                          // }
                          await CacheHelper()
                              .saveData(key: 'sendToken', value: true);
                          await orderController.makeOrder();
                          // Get.back();
                          Navigator.pop(context);
                        },
                        child: const Text("Make an Order"),
                      ),
                    ),
                    // const SizedBox(height: 40,),
                    // const Text('bottomsheet ends here')
                  ],
                ),
              ),
            ),
          ));
}


// void showCustomBottomSheet() {
//   Get.bottomSheet(
//     Container(
//       padding: const EdgeInsets.all(16),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: const [
//           Text(
//             'Reusable GetX Bottom Sheet',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 12),
//           Text('This content comes from a reusable function.'),
//         ],
//       ),
//     ),
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//   );
// }

// showModalBottomSheet(
// context: context,
// isScrollControlled: true,
// shape: const RoundedRectangleBorder(
// borderRadius: BorderRadius.vertical(
// top: Radius.circular(20))),
// builder: (context) => Padding(
// padding: EdgeInsets.only(
// bottom:
// MediaQuery.of(context).viewInsets.bottom,
// ),
// child: SizedBox(
// //to control bottom sheet height
// height:
// MediaQuery.of(context).size.height * 0.50,
// child: Form(
// key: orderController.orderFormKey,
// child: ListView(
// padding: const EdgeInsets.all(30),
// children: [
// const Center(
// child: Text('Make an Order')),
// addVerticalSpace(15),
// CustomOrderField(
// controller: orderController
//     .objectNameController,
// hintText: 'type here',
// labelText:
// 'what do you want to deliver',
// ),
// CustomOrderField(
// controller:
// orderController.sourceController,
// hintText: 'type here',
// labelText: 'pickup location',
// ),
// CustomOrderField(
// controller: orderController
//     .destinationController,
// hintText: 'type here',
// labelText: 'drop location',
// ),
// addVerticalSpace(15),
// //todo bottomsheet button
// Center(
// child: MaterialButton(
// onPressed: () async {
// // if(orderController.orderFormKey.currentState!.validate()){
// //   await CacheHelper().saveData(key: 'orderBool', value: true);
// //   await orderController.makeOrder();
// // }
// await CacheHelper().saveData(
// key: 'sendToken',
// value: true);
// await orderController.makeOrder();
// // Get.back();
// Navigator.pop(context);
// },
// shape: RoundedRectangleBorder(
// borderRadius:
// BorderRadius.circular(20)),
// color: Colors.orange[200],
// child: const Text("Make an Order"),
// ),
// ),
// //todo bottomsheet button
// Center(
// child: ElevatedButton(
// onPressed: () async {
// // if(orderController.orderFormKey.currentState!.validate()){
// //   await CacheHelper().saveData(key: 'orderBool', value: true);
// //   await orderController.makeOrder();
// // }
// await CacheHelper().saveData(
// key: 'sendToken',
// value: true);
// await orderController.makeOrder();
// // Get.back();
// Navigator.pop(context);
// },
// child: const Text("Make an Order"),
// ),
// ),
// // const SizedBox(height: 40,),
// // const Text('bottomsheet ends here')
// ],
// ),
// ),
// ),
// ));
