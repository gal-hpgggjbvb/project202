import 'dart:convert';

import 'package:get/get.dart';
import 'package:project2/api/api_consumer.dart';
import 'package:project2/controller/sign_status.dart';
import 'package:project2/model/errors/exceptions.dart';
import 'package:project2/model/user/order/fetch_orders_model.dart';

class FetchOrdersController extends GetxController {
  final ApiConsumer api;

  FetchOrdersController(this.api);

  FetchOrdersModel? fetchOrdersModel;

  // var ordersList = <Orders>[];
  List<dynamic> users = [] ;

  // Load orders from JSON response
  // void loadOrdersFromJson(Map<String, dynamic> json) {
  //   List<dynamic> ordersJson = json['orders'];
  //   ordersList = ordersJson.map((e) => Orders.fromJson(e)).toList();
  // }
  // List<Orders> ordersList = [] ;
  // List<Map<String , dynamic>> ordersList = [] ;
// var ordersList = jsonData['orders'] as List;
  // orders.value = ordersList.map((e) => Order.fromJson(e)).toList();
  Future<void> refreshTab2() async {
    // await Future.delayed(const Duration(seconds: 1)) ;
    await fetchOrders() ;
  }

  fetchOrders() async {
    try {
      final response = await api.get(
        'http://10.0.2.2:8000/api/orders/my_orders',
      );
      fetchOrdersModel = FetchOrdersModel.fromJson(response) ;

      // loadOrdersFromJson(response) ;
      // print(ordersList) ;

      // final body = response.body ;
      // final json = jsonDecode(body) ;
      // users = json['orders'] ;

      // ordersList = fetchOrdersModel!.orders ;
      users = fetchOrdersModel!.orders ;
      // print('orders here ****************************') ;
      // print(fetchOrdersModel!.orders.length) ;
      // print(fetchOrdersModel!.orders.toList()) ;
      // print(fetchOrdersModel!.orders[0].userId) ;

      // print('users here ************************************') ;
      // print(users.length) ;
      // print(users.toString());
      // print(users);
      print(response) ;
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
    }
    //todo to update tab2 -refresh-
    update();
  }
}
