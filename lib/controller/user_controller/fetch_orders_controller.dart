import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/api/api_consumer.dart';
import 'package:project2/controller/sign_status.dart';
import 'package:project2/model/errors/exceptions.dart';
import 'package:project2/model/user/order/fetch_orders_model.dart';

import '../../cache/cache_helper.dart';

class FetchOrdersController extends GetxController {
  final ApiConsumer api;

  FetchOrdersController(this.api);

  FetchOrdersModel? fetchOrdersModel;

  //order edit form key
  GlobalKey<FormState> editFormKey = GlobalKey() ;
  //order edit name
  TextEditingController editNameController = TextEditingController();
  //order edit source
  TextEditingController editSourceController = TextEditingController();
  //order edit destination
  TextEditingController editDestinationController = TextEditingController();
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
    await CacheHelper().saveData(key: 'sendToken', value: true);
    await fetchOrders() ;
  }

  fetchOrders() async {
    try {
      await CacheHelper().saveData(key: 'sendToken', value: true) ;
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


  deleteOrder() async {
    try {
      await CacheHelper().saveData(key: 'sendToken', value: true);
      final orderId = await CacheHelper().getData(key: 'orderId') ;
      final response = await api.delete('http://10.0.2.2:8000/api/orders/$orderId') ;
      print('delete response here ***********************************') ;
      print(response) ;
      SignStatus().signSuccess('order deleted successfully', '') ;
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message) ;
    }
    print('try fetching after delete here ************************************') ;
    // refreshTab2() ;
    fetchOrders() ;
    update() ;
  }
  
  editOrder() async {
    try {
      await CacheHelper().saveData(key: 'sendToken', value: true) ;
      final orderId = await CacheHelper().getData(key: 'orderId') ;
      // print('try to respond here *****************') ;
      // final response = await api.put('http://10.0.2.2:8000/api/orders/57',
      final response = await api.put('http://10.0.2.2:8000/api/orders/$orderId',
      data: {
        "order_name": editNameController.text,
        "source": editSourceController.text,
        "destination": editDestinationController.text,
      });

      print(response) ;
      SignStatus().signSuccess('order edited successfully', '') ;
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message) ;
    }
    print('try  fetching after edit here ************************************') ;
    fetchOrders() ;
    update() ;
  }
}

