import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/api/api_consumer.dart';
import 'package:project2/controller/auth/sign_status.dart';
import 'package:project2/functions/show_success_dialog.dart';
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

  // var ordersList = <Orders>[];
  List<dynamic> orderList = [];

  Future<void> refreshTab2() async {
    // await Future.delayed(const Duration(seconds: 1)) ;
    await CacheHelper().saveData(key: 'sendToken', value: true);
    await fetchOrders();
    update();
  }

  fetchOrders() async {
    try {
      await CacheHelper().saveData(key: 'sendToken', value: true);
      final response = await api.get(
        'http://10.0.2.2:8000/api/orders/my_orders',
      );
      fetchOrdersModel = FetchOrdersModel.fromJson(response);

      orderList = fetchOrdersModel!.orders;
      print(response);
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
    }
    //todo to update tab2 -refresh-
    update();
  }

  deleteOrder() async {
    try {
      await CacheHelper().saveData(key: 'sendToken', value: true);
      final orderId = await CacheHelper().getData(key: 'orderId');
      final response =
          await api.delete('http://10.0.2.2:8000/api/orders/$orderId');
      // print('delete response here ***********************************');
      print(response);
      SignStatus().signSuccess('order deleted successfully', '');
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
    }
    // print('try fetching after delete here ************************************');
    // refreshTab2() ;
    fetchOrders();
    update();
  }

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

      print(response);
      SignStatus().signSuccess('order edited successfully', '');
      // showSuccessDialog( Get.context ,title: 'Your Order Updated Successfully', desc: 'Done',onOk: (){}) ;
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
    }
    fetchOrders();
    update();
  }
}
