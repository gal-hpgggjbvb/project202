import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/api/api_consumer.dart';
import 'package:project2/controller/auth/sign_status.dart';
import 'package:project2/model/errors/exceptions.dart';
import 'package:project2/model/user/order/fetch_orders_model.dart';

import '../../cache/cache_helper.dart';

class FetchOrdersController extends GetxController {
  final ApiConsumer api;

  FetchOrdersController(this.api);

  FetchOrdersModel? fetchOrdersModel;

  //order edit form key
  GlobalKey<FormState> editFormKey = GlobalKey();

  //order edit name
  TextEditingController editNameController = TextEditingController();

  //order edit source
  TextEditingController editSourceController = TextEditingController();

  //order edit destination
  TextEditingController editDestinationController = TextEditingController();

  //for refresh indicator
  GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey();
  // GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();

  // var ordersList = <Orders>[];
  List<dynamic> orderList = [];
  List<dynamic> pendingOrdersList = [];
  List<dynamic> inProgressOrdersList = [];
  List<dynamic> completedOrdersList = [];

  // Future<void> refreshTab2() async {
  //   // await Future.delayed(const Duration(seconds: 1)) ;
  //   // await CacheHelper().saveData(key: 'sendToken', value: true);
  //   await fetchOrders();
  //   update();
  // }

  Future<void> refreshTab1() async {
    await fetchPendingOrders();
    update();
  }
  Future<void> refreshTab2() async {
    await fetchInProgressOrders();
    update();
  }
  Future<void> refreshTab3() async {
    await fetchCompletedOrders();
    update();
  }

  fetchOrders() async {
    try {
      //todo to trigger refresh
      // refreshKey.currentState?.show();
      // print('fetch orders ++++++++++++++++++++++++++++++++++');
      await CacheHelper().saveData(key: 'sendToken', value: true);
      final response = await api.get(
        'http://10.0.2.2:8000/api/orders/my_orders',
      );
      if (CacheHelper().getData(key: 'statusCode') == 200) {
        fetchOrdersModel = FetchOrdersModel.fromJson(response);
        orderList = fetchOrdersModel!.orders;
        // print(response);
        CacheHelper().removeData(key: 'statusCode');
      }
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
    }
    //todo to trigger refresh
    // refreshKey.currentState?.show();
    //todo to update tab2 -refresh-
    update();
  }

  ///todo pending orders
  fetchPendingOrders() async {
    try {
      //todo to trigger refresh
      refreshKey.currentState?.show();
      // print('pending orders ++++++++++++++++++++++++++++++++++');
      pendingOrdersList.clear();
      await CacheHelper().saveData(key: 'sendToken', value: true);
      final response = await api.get(
        'http://10.0.2.2:8000/api/orders/my_orders',
      );
      if (CacheHelper().getData(key: 'statusCode') == 200) {
        fetchOrdersModel = FetchOrdersModel.fromJson(response);
        for(int i=0 ; i<fetchOrdersModel!.orders.length ; i++){
          if(fetchOrdersModel!.orders[i].status == 'pending'){
            pendingOrdersList.add(fetchOrdersModel!.orders[i]);
          }
        }
        print(response);
        print(pendingOrdersList[0].id);
        CacheHelper().removeData(key: 'statusCode');
      }
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
    }
    //todo to trigger refresh
    // refreshKey.currentState?.show();
    //todo to update tab2 -refresh-
    update();
  }

  ///todo in progress orders
  fetchInProgressOrders() async {
    try {
      //todo to trigger refresh
      refreshKey.currentState?.show();
      inProgressOrdersList.clear();
      await CacheHelper().saveData(key: 'sendToken', value: true);
      final response = await api.get(
        'http://10.0.2.2:8000/api/orders/my_orders',
      );
      if (CacheHelper().getData(key: 'statusCode') == 200) {
        fetchOrdersModel = FetchOrdersModel.fromJson(response);
        for(int i=0 ; i<fetchOrdersModel!.orders.length ; i++){
          if(fetchOrdersModel!.orders[i].status == 'in_progress'){
            inProgressOrdersList.add(fetchOrdersModel!.orders[i]);
          }
        }
        // print(response);
        CacheHelper().removeData(key: 'statusCode');
      }
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
    }
    //todo to trigger refresh
    // refreshKey.currentState?.show();
    //todo to update tab2 -refresh-
    update();
  }

  ///todo completed orders
  fetchCompletedOrders() async {
    try {
      //todo to trigger refresh
      refreshKey.currentState?.show();
      completedOrdersList.clear();
      await CacheHelper().saveData(key: 'sendToken', value: true);
      final response = await api.get(
        'http://10.0.2.2:8000/api/orders/my_orders',
      );
      if (CacheHelper().getData(key: 'statusCode') == 200) {
        fetchOrdersModel = FetchOrdersModel.fromJson(response);
        for(int i=0 ; i<fetchOrdersModel!.orders.length ; i++){
          if(fetchOrdersModel!.orders[i].status == 'completed'){
            completedOrdersList.add(fetchOrdersModel!.orders[i]);
          }
        }
        // print(response);
        CacheHelper().removeData(key: 'statusCode');
      }
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
    }
    //todo to trigger refresh
    // refreshKey.currentState?.show();
    //todo to update tab2 -refresh-
    update();
  }

  ///todo delete order
  deleteOrder() async {
    try {
      await CacheHelper().saveData(key: 'sendToken', value: true);
      final orderId = await CacheHelper().getData(key: 'orderId');
      await api.delete('http://10.0.2.2:8000/api/orders/$orderId');
      // print('delete response here ***********************************');
      if (CacheHelper().getData(key: 'statusCode') == 200) {
        SignStatus().signSuccess('order deleted successfully', '');
        CacheHelper().removeData(key: 'orderID');
        CacheHelper().removeData(key: 'statusCode');
      }
      // print(response);
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
    }
    // print('try fetching after delete here ************************************');
    // refreshTab2() ;
    fetchOrders();
    update();
  }

  ///todo edit order
  editOrder() async {
    try {
      await CacheHelper().saveData(key: 'sendToken', value: true);
      final orderId = await CacheHelper().getData(key: 'orderId');
      // print('try to respond here *****************') ;
      // final response = await api.put('http://10.0.2.2:8000/api/orders/57',
      final response =
          await api.put('http://10.0.2.2:8000/api/orders/$orderId', data: {
        "order_name": editNameController.text,
        "source": editSourceController.text,
        "destination": editDestinationController.text,
      });
      if (CacheHelper().getData(key: 'statusCode') == 200) {
        print(response);
        SignStatus().signSuccess('order edited successfully', '');
        // showSuccessDialog( Get.context ,title: 'Your Order Updated Successfully', desc: 'Done',onOk: (){}) ;
        CacheHelper().removeData(key: 'statusCode');
      }
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
    }
    fetchOrders();
    update();
  }
}
