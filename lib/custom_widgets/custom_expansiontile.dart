import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/api/dio_consumer.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/controller/user_controller/fetch_orders_controller.dart';
import 'package:project2/controller/user_controller/order_controller.dart';
import 'package:project2/custom_widgets/custom_order_field.dart';

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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        collapsedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        collapsedBackgroundColor: Colors.orange.shade300,
        backgroundColor: Colors.deepOrange[50],
        leading: Text('Order ID: $leading'),
        title: Text(
            title.length>15 ? 
            '   Order Name: \n    ${title.substring(0,15)}...' :
          '   Order Name: \n    $title',
          // '   Order Name: ${title.substring(0,1)}...',
        ),
        // subtitle: const Text(''),
        // trailing: Text('trailing'),
        trailing: Text('Status : $trailing'),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //todo id
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('OrderId :           '),
                  ),
                  Text('$id'),
                ],
              ),
              // const Padding(padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 30), child: Divider(height: 0.0,),),
              //todo order name
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('OrderName :     '),
                  ),
                  Expanded(child: Text(name,
                  // softWrap: true,
                  //   overflow: TextOverflow.visible,
                  //   maxLines: null,
                  )),
                ],
              ),
              //todo source name
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('source :             '),
                  ),
                  Expanded(child: Text(source)),
                ],
              ),
              //todo destination name
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('destination :      '),
                  ),
                  Expanded(child: Text(destination)),
                ],
              ),
              //todo status
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('status :              '),
                  ),
                  Text(status),
                ],
              ),
              //todo createdat
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text('Createdat :        '),
                  ),
                  Text('$created'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                          builder: (context) =>
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).viewInsets.bottom,
                                ),
                                child: SizedBox(
                                  //to control bottom sheet height
                                  height: MediaQuery.of(context).size.height * 0.50,
                                  child: Form(
                                    key: fetchOrdersController.editFormKey,
                                    child: ListView(
                                      padding: const EdgeInsets.all(30),
                                      children: [
                                        Center(
                                            child: Text('Edit Order $id')),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        CustomOrderField(
                                          controller: fetchOrdersController.editNameController,
                                          // controller: orderController.objectNameController,
                                          hintText: 'type here',
                                          labelText:
                                          'what do you want to deliver',
                                        ),
                                        CustomOrderField(
                                          controller: fetchOrdersController.editSourceController,
                                          hintText: 'type here',
                                          labelText: 'pickup location',
                                        ),
                                        CustomOrderField(
                                          controller: fetchOrdersController.editDestinationController,
                                          hintText: 'type here',
                                          labelText: 'drop location',
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        //todo bottom sheet button
                                        Center(
                                          child: MaterialButton(
                                            onPressed: () async {
                                              await CacheHelper().saveData(key: 'orderId', value: id) ;
                                              await fetchOrdersController.editOrder() ;
                                              Navigator.pop(context) ;
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    20)),
                                            color: Colors.orange[200],
                                            child:
                                            const Text("Edit my Order"),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 400,
                                        ),
                                        const Text('bottomsheet ends here')
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "Edit",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
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
                            await CacheHelper().saveData(key: 'orderId', value: id) ;
                            await fetchOrdersController.deleteOrder() ;
                          },
                      ).show();

                      // await CacheHelper().saveData(key: 'orderId', value: id) ;
                      // await fetchOrdersController.deleteOrder() ;
                      // // print('id hereeeeeeeeeeee **************** $id') ;
                      // // print('cach  id hereeeeeeeeeeee **************** ') ;
                      // // print(CacheHelper().getData(key: 'orderId')) ;
                    },
                    padding: const EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "Delete",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          )
        ],
      ),
    );
  }
}
