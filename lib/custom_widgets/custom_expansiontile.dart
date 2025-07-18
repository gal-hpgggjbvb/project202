import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/api/dio_consumer.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/controller/user_controller/fetch_orders_controller.dart';
import 'package:project2/controller/user_controller/order_controller.dart';
import 'package:project2/custom_widgets/custom_order_field.dart';
import 'package:project2/functions/add_space.dart';

FetchOrdersController fetchOrdersController =
    Get.put(FetchOrdersController(DioConsumer(dio: Dio())));
OrderController orderController =
    Get.put(OrderController(DioConsumer(dio: Dio())));

class CustomExpansionTile extends StatelessWidget {
  final int leading;

  final String title;

  final String trailing;

  final int id;

  final String name;

  final String source;

  final String destination;

  final String status;

  final DateTime created;

  const CustomExpansionTile(
      {super.key,
      required this.leading,
      required this.title,
      required this.trailing,
      required this.id,
      required this.name,
      required this.source,
      required this.destination,
      required this.status,
      required this.created});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10.0, right: 5.0, left: 5.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: ExpansionTile(
        //on expansion shape
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        // collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        // collapsedBackgroundColor: Colors.orange.shade300,
        // collapsedBackgroundColor: Themes.customLightTheme.colorScheme.primary,
        // backgroundColor: Colors.deepOrange[50],
        leading: Text(
          'Order ID: $leading',
          //style: context.theme.textTheme.bodySmall,
          style: TextStyle(
            fontFamily: "Satoshi",
            color: context.theme.primaryColor,
            fontSize: 15,
            fontWeight: FontWeight.normal, // typing style
          ),
        ),
        title: Text(
          title.length > 15
              ? '   Order Name: \n    ${title.substring(0, 15)}...'
              : '   Order Name: \n    $title',
          style: TextStyle(
            fontFamily: "Satoshi",
            color: context.theme.primaryColor,
            fontSize: 15,
            fontWeight: FontWeight.normal, // typing style
          ),
        ),
        // subtitle: const Text(''),
        // trailing: Text('trailing'),
        trailing: Text(
          'Status : $trailing',
          style: TextStyle(
            fontFamily: "Satoshi",
            color: context.theme.primaryColor,
            fontSize: 15,
            fontWeight: FontWeight.normal, // typing style
          ),
        ),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //todo id
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
                      'OrderId :           ',
                      style: context.textTheme.displaySmall,
                    ),
                  ),
                  Text(
                    '$id',
                    style: context.textTheme.displaySmall,
                  ),
                ],
              ),
              addVerticalSpace(7),
              //todo order name
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
                      'OrderName :     ',
                      style: context.textTheme.displaySmall,
                    ),
                  ),
                  Expanded(
                      child: Text(
                    name,
                    style: context.textTheme.displaySmall,
                    // softWrap: true,
                    //   overflow: TextOverflow.visible,
                    //   maxLines: null,
                  )),
                ],
              ),
              addVerticalSpace(7),
              //todo source name
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
                      'Source :             ',
                      style: context.textTheme.displaySmall,
                    ),
                  ),
                  Expanded(
                      child: Text(
                    source,
                    style: context.textTheme.displaySmall,
                  )),
                ],
              ),
              addVerticalSpace(7),
              //todo destination name
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
                      'Destination :      ',
                      style: context.textTheme.displaySmall,
                    ),
                  ),
                  Expanded(
                      child: Text(
                    destination,
                    style: context.textTheme.displaySmall,
                  )),
                ],
              ),
              addVerticalSpace(7),
              //todo status
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
                      'Status :              ',
                      style: context.textTheme.displaySmall,
                    ),
                  ),
                  Text(
                    status,
                    style: context.textTheme.displaySmall,
                  ),
                ],
              ),
              addVerticalSpace(7),
              //todo createdat
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
                      'Createdat :        ',
                      style: context.textTheme.displaySmall,
                    ),
                  ),
                  Text(
                    '$created',
                    style: context.textTheme.displaySmall,
                  ),
                ],
              ),
              addVerticalSpace(10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Divider(),
              ),
              //todo buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //todo edit button
                  MaterialButton(
                    onPressed: () async {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          builder: (context) => Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                ),
                                child: SizedBox(
                                  //to control bottom sheet height
                                  height:
                                      MediaQuery.of(context).size.height * 0.50,
                                  child: Form(
                                    key: fetchOrdersController.editFormKey,
                                    child: ListView(
                                      padding: const EdgeInsets.all(30),
                                      children: [
                                        Center(child: Text('Edit Order $id',
                                          style: TextStyle(
                                            fontFamily: "Satoshi",
                                            color: context.theme.primaryColor,
                                            fontSize: 17,
                                            fontWeight: FontWeight.normal, // typing style
                                          ),)),

                                        addVerticalSpace(15),

                                        CustomOrderField(
                                          controller: fetchOrdersController
                                              .editNameController,
                                          // controller: orderController.objectNameController,
                                          hintText: 'type here',
                                          labelText:
                                              'what do you want to deliver',
                                        ),
                                        CustomOrderField(
                                          controller: fetchOrdersController
                                              .editSourceController,
                                          hintText: 'type here',
                                          labelText: 'pickup location',
                                        ),
                                        CustomOrderField(
                                          controller: fetchOrdersController
                                              .editDestinationController,
                                          hintText: 'type here',
                                          labelText: 'drop location',
                                        ),
                                        addVerticalSpace(15),
                                        //todo bottom sheet button
                                        Center(
                                          child: MaterialButton(
                                            onPressed: () async {
                                              await CacheHelper().saveData(
                                                  key: 'orderId', value: id);
                                              await fetchOrdersController
                                                  .editOrder();
                                              Navigator.pop(context);
                                            },
                                            minWidth: 150,height: 50,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            // color: Colors.orange[200],
                                            color: context.theme.colorScheme.primary,
                                            child: Text("Edit my Order",
                                              style: TextStyle(
                                                fontFamily: "Satoshi",
                                                color: context.theme.colorScheme.onSecondary,
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal, // typing style
                                              ),),
                                          ),
                                        ),
                                        // addVerticalSpace(20),
                                        // Text('bottomsheet ends here',
                                        //   style: TextStyle(
                                        //     fontFamily: "Satoshi",
                                        //     color: context.theme.primaryColor,
                                        //     fontSize: 15,
                                        //     fontWeight: FontWeight.normal, // typing style
                                        //   ),),
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                      //two working lines instead of bottom sheet
                      // await CacheHelper().saveData(key: 'orderId', value: id) ;
                      // await fetchOrdersController.editOrder() ;
                    },
                    // color: Colors.blue,
                    padding: const EdgeInsets.all(5),
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    minWidth: 5,
                    height: 10,
                    child: Text(
                      "Edit",
                      style: context.theme.textTheme.displaySmall!
                          .copyWith(color: Colors.blue),
                      // style: TextStyle(
                      //     color: Colors.blue,
                      //     fontSize: 15,
                      //     fontWeight: FontWeight.w400),
                    ),
                  ),
                  //todo delete button
                  MaterialButton(
                    onPressed: () async {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.rightSlide,
                        dismissOnTouchOutside: false,
                        title: 'Delete Order with ID $id',
                        // desc: 'Dialog description here.............',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () async {
                          await CacheHelper()
                              .saveData(key: 'orderId', value: id);
                          await fetchOrdersController.deleteOrder();
                        },
                      ).show();

                      // await CacheHelper().saveData(key: 'orderId', value: id) ;
                      // await fetchOrdersController.deleteOrder() ;
                      // // print('id hereeeeeeeeeeee **************** $id') ;
                      // // print('cach  id hereeeeeeeeeeee **************** ') ;
                      // // print(CacheHelper().getData(key: 'orderId')) ;
                    },
                    padding: const EdgeInsets.all(5),
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    minWidth: 5,
                    height: 10,
                    child: Text(
                      "Delete",
                      style: context.theme.textTheme.displaySmall!
                          .copyWith(color: Colors.red),

                      // style: TextStyle(
                      //     color: Colors.red,
                      //     fontSize: 15,
                      //     fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(5),
              // Text('data'),
              // Text('data'),
              // Text('data'),
            ],
          ),

          //     //todo buttons
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         //todo edit button
          //         MaterialButton(
          //           onPressed: () async {
          //             showModalBottomSheet(
          //                 context: context,
          //                 isScrollControlled: true,
          //                 shape: const RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.vertical(
          //                         top: Radius.circular(20))),
          //                 builder: (context) => Padding(
          //                       padding: EdgeInsets.only(
          //                         bottom:
          //                             MediaQuery.of(context).viewInsets.bottom,
          //                       ),
          //                       child: SizedBox(
          //                         //to control bottom sheet height
          //                         height:
          //                             MediaQuery.of(context).size.height * 0.50,
          //                         child: Form(
          //                           key: fetchOrdersController.editFormKey,
          //                           child: ListView(
          //                             padding: const EdgeInsets.all(30),
          //                             children: [
          //                               Center(child: Text('Edit Order $id')),
          //                               const SizedBox(
          //                                 height: 15,
          //                               ),
          //                               CustomOrderField(
          //                                 controller: fetchOrdersController
          //                                     .editNameController,
          //                                 // controller: orderController.objectNameController,
          //                                 hintText: 'type here',
          //                                 labelText:
          //                                     'what do you want to deliver',
          //                               ),
          //                               CustomOrderField(
          //                                 controller: fetchOrdersController
          //                                     .editSourceController,
          //                                 hintText: 'type here',
          //                                 labelText: 'pickup location',
          //                               ),
          //                               CustomOrderField(
          //                                 controller: fetchOrdersController
          //                                     .editDestinationController,
          //                                 hintText: 'type here',
          //                                 labelText: 'drop location',
          //                               ),
          //                               addVerticalSpace(15),
          //                               //todo bottom sheet button
          //                               Center(
          //                                 child: MaterialButton(
          //                                   onPressed: () async {
          //                                     await CacheHelper().saveData(
          //                                         key: 'orderId', value: id);
          //                                     await fetchOrdersController
          //                                         .editOrder();
          //                                     Navigator.pop(context);
          //                                   },
          //                                   shape: RoundedRectangleBorder(
          //                                       borderRadius:
          //                                           BorderRadius.circular(20)),
          //                                   color: Colors.orange[200],
          //                                   child: const Text("Edit my Order"),
          //                                 ),
          //                               ),
          //                               const SizedBox(
          //                                 height: 400,
          //                               ),
          //                               const Text('bottomsheet ends here')
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //                     ));
          //             //two working lines instead of bottom sheet
          //             // await CacheHelper().saveData(key: 'orderId', value: id) ;
          //             // await fetchOrdersController.editOrder() ;
          //           },
          //           // color: Colors.blue,
          //           padding: const EdgeInsets.all(5),
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(20)),
          //           child: Text(
          //             "Edit",
          //             style: context.theme.textTheme.displaySmall!
          //                 .copyWith(color: Colors.blue),
          //             // style: TextStyle(
          //             //     color: Colors.blue,
          //             //     fontSize: 15,
          //             //     fontWeight: FontWeight.w400),
          //           ),
          //         ),
          //         //todo delete button
          //         MaterialButton(
          //           onPressed: () async {
          //             AwesomeDialog(
          //               context: context,
          //               dialogType: DialogType.warning,
          //               animType: AnimType.rightSlide,
          //               dismissOnTouchOutside: false,
          //               title: 'Delete Order with ID $id',
          //               // desc: 'Dialog description here.............',
          //               btnCancelOnPress: () {},
          //               btnOkOnPress: () async {
          //                 await CacheHelper()
          //                     .saveData(key: 'orderId', value: id);
          //                 await fetchOrdersController.deleteOrder();
          //               },
          //             ).show();
          //
          //             // await CacheHelper().saveData(key: 'orderId', value: id) ;
          //             // await fetchOrdersController.deleteOrder() ;
          //             // // print('id hereeeeeeeeeeee **************** $id') ;
          //             // // print('cach  id hereeeeeeeeeeee **************** ') ;
          //             // // print(CacheHelper().getData(key: 'orderId')) ;
          //           },
          //           padding: const EdgeInsets.all(5),
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(20)),
          //           child: Text(
          //             "Delete",
          //             style: context.theme.textTheme.displaySmall!
          //                 .copyWith(color: Colors.red),
          //
          //             // style: TextStyle(
          //             //     color: Colors.red,
          //             //     fontSize: 15,
          //             //     fontWeight: FontWeight.w400),
          //           ),
          //         ),
          //       ],
          //     ),
          //
          //     addVerticalSpace(5),
          //   ],
          // ),
        ],
      ),
    );
  }
}
