import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/api/api_consumer.dart';
import 'package:project2/controller/auth/sign_status.dart';
import 'package:project2/model/errors/exceptions.dart';
import 'package:project2/model/user/order/user_completed_orders_model.dart';
import 'package:project2/model/user/order/user_inprogress_orders_model.dart';
import 'package:project2/model/user/order/user_pending_orders_model.dart';

import '../../cache/cache_helper.dart';

class FetchOrdersController extends GetxController {
  final ApiConsumer api;

  FetchOrdersController(this.api);

  //order edit form key
  GlobalKey<FormState> editFormKey = GlobalKey();

  //order edit name
  TextEditingController editNameController = TextEditingController();

  //order edit source
  TextEditingController editSourceController = TextEditingController();

  //order edit destination
  TextEditingController editDestinationController = TextEditingController();

  ///keys for refresh indicators
  GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey();
  GlobalKey<RefreshIndicatorState> refreshKey1 = GlobalKey();
  GlobalKey<RefreshIndicatorState> refreshKey2 = GlobalKey();
  GlobalKey<RefreshIndicatorState> refreshKey3 = GlobalKey();

  // GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();

  // var ordersList = <Orders>[];
  ///lists
  // List<dynamic> orderList = [];
  List<dynamic> pendingOrdersList = [];
  List<dynamic> inProgressOrdersList = [];
  List<dynamic> completedOrdersList = [];

  ///models
  // FetchOrdersModel? fetchOrdersModel;
  UserPendingOrdersModel? userPendingOrdersModel;
  UserInProgressOrdersModel? userInProgressOrdersModel;
  UserCompletedOrdersModel? userCompletedOrdersModel;

  Future<void> refreshTab1() async {
    refreshKey1.currentState?.show();
    await fetchPendingOrders();
    // print('refresh tab pending orders ++++++++++++++++++++++++++++++++++');
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

  ///todo pending orders
  fetchPendingOrders() async {
    try {
      //todo to trigger refresh
      refreshKey1.currentState?.show();
      // print('fetch pending orders ++++++++++++++++++++++++++++++++++');
      // pendingOrdersList.clear();
      await CacheHelper().saveData(key: 'sendToken', value: true);
      final response = await api.get(
        'http://10.0.2.2:8000/api/orders/my_pending_orders',
      );
      if (CacheHelper().getData(key: 'statusCode') == 200) {
        userPendingOrdersModel = UserPendingOrdersModel.fromJson(response);
        pendingOrdersList = userPendingOrdersModel!.orders;

        CacheHelper().removeData(key: 'statusCode');
      }
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
    }
    //todo to trigger refresh
    // refreshKey.currentState?.show();
    //todo to update tab2 -refresh-
    // update();
  }

  ///todo in progress orders
  fetchInProgressOrders() async {
    try {
      //todo to trigger refresh
      refreshKey2.currentState?.show();
      // inProgressOrdersList.clear();
      await CacheHelper().saveData(key: 'sendToken', value: true);
      final response = await api.get(
        'http://10.0.2.2:8000/api/orders/my_progress_orders',
      );
      if (CacheHelper().getData(key: 'statusCode') == 200) {
        userInProgressOrdersModel =
            UserInProgressOrdersModel.fromJson(response);
        inProgressOrdersList = userInProgressOrdersModel!.orders;
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
      refreshKey3.currentState?.show();
      // completedOrdersList.clear();
      await CacheHelper().saveData(key: 'sendToken', value: true);
      final response = await api.get(
        'http://10.0.2.2:8000/api/orders/my_completed_orders',
      );
      if (CacheHelper().getData(key: 'statusCode') == 200) {
        userCompletedOrdersModel = UserCompletedOrdersModel.fromJson(response);
        completedOrdersList = userCompletedOrdersModel!.orders;

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
        SignStatus().signSuccess('order $orderId deleted successfully', '');
        CacheHelper().removeData(key: 'orderID');
        CacheHelper().removeData(key: 'statusCode');
      }
      // print(response);
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
    }
    // print('try fetching after delete here ************************************');
    // refreshTab2() ;
    fetchPendingOrders();
    // fetchOrders();
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
        SignStatus().signSuccess('order $orderId edited successfully', '');
        // showSuccessDialog( Get.context ,title: 'Your Order Updated Successfully', desc: 'Done',onOk: (){}) ;
        CacheHelper().removeData(key: 'statusCode');
      }
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
    }
    fetchPendingOrders();
    // refreshKey1.currentState?.show();
    // fetchOrders();
    update();
  }
}

// fetchOrders() async {
//   try {
//     //todo to trigger refresh
//     // refreshKey.currentState?.show();
//     // print('fetch orders ++++++++++++++++++++++++++++++++++');
//     await CacheHelper().saveData(key: 'sendToken', value: true);
//     final response = await api.get(
//       'http://10.0.2.2:8000/api/orders/my_orders',
//     );
//     if (CacheHelper().getData(key: 'statusCode') == 200) {
//       fetchOrdersModel = FetchOrdersModel.fromJson(response);
//       orderList = fetchOrdersModel!.orders;
//       // print(response);
//       CacheHelper().removeData(key: 'statusCode');
//     }
//   } on ServerExceptions catch (e) {
//     SignFailed(errorMessage: e.errorModel.message);
//   }
//   //todo to trigger refresh
//   // refreshKey.currentState?.show();
//   //todo to update tab2 -refresh-
//   update();
// }

// ///todo completed orders
// fetchCompletedOrders() async {
//   try {
//     //todo to trigger refresh
//     refreshKey3.currentState?.show();
//     completedOrdersList.clear();
//     await CacheHelper().saveData(key: 'sendToken', value: true);
//     final response = await api.get(
//       'http://10.0.2.2:8000/api/orders/my_orders',
//     );
//     if (CacheHelper().getData(key: 'statusCode') == 200) {
//       fetchOrdersModel = FetchOrdersModel.fromJson(response);
//       for(int i=0 ; i<fetchOrdersModel!.orders.length ; i++){
//         if(fetchOrdersModel!.orders[i].status == 'completed'){
//           completedOrdersList.add(fetchOrdersModel!.orders[i]);
//         }
//       }
//       // print(response);
//       CacheHelper().removeData(key: 'statusCode');
//     }
//   } on ServerExceptions catch (e) {
//     SignFailed(errorMessage: e.errorModel.message);
//   }
//   //todo to trigger refresh
//   // refreshKey.currentState?.show();
//   //todo to update tab2 -refresh-
//   update();
// }
