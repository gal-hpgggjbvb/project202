import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/api/dio_consumer.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/controller/user_controller/fetch_orders_controller.dart';

FetchOrdersController fetchOrdersController =
    Get.put(FetchOrdersController(DioConsumer(dio: Dio())));

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
        // collapsedBackgroundColor: Colors.orangeAccent,
        collapsedBackgroundColor: Colors.orangeAccent,
        leading: Text('Order ID: ${leading}'),
        title: Text(
          '   Order Name: $title',
        ),
        // subtitle: const Text(''),
        // trailing: Text('trailing'),
        trailing: Text('Status : $trailing'),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text('OrderId :           '),
                  ),
                  Text('${id}'),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text('OrderName :     '),
                  ),
                  Text(name),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text('source :             '),
                  ),
                  Text(source),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text('destination :      '),
                  ),
                  Text(destination),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text('status :              '),
                  ),
                  Text(status),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    // color: Colors.blue,
                    padding: const EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "Edit",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () async {
                      await CacheHelper().saveData(key: 'orderId', value: id) ;
                      await fetchOrdersController.deleteOrder() ;
                      // print('id hereeeeeeeeeeee **************** $id') ;
                      // print('cach  id hereeeeeeeeeeee **************** ') ;
                      // print(CacheHelper().getData(key: 'orderId')) ;
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
