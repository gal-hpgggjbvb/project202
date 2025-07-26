import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/api/api_consumer.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/controller/auth/sign_status.dart';
import 'package:project2/model/delivery_man_model/fetch_completed_orders_model.dart';
import 'package:project2/model/delivery_man_model/fetch_pending_orders_model.dart';
import 'package:project2/model/delivery_man_model/fitch_picked_orders_model.dart';
import 'package:project2/model/errors/exceptions.dart';

class AvailableOrdersController extends GetxController {
  final ApiConsumer api;

  AvailableOrdersController(this.api);

  late SignStatus signStatus;

  @override
  onInit() {
    super.onInit();
    signStatus = Get.put(SignStatus());
  }

  GlobalKey<RefreshIndicatorState> refreshTabKey1 = GlobalKey();
  GlobalKey<RefreshIndicatorState> refreshTabKey2 = GlobalKey();
  GlobalKey<RefreshIndicatorState> refreshTabKey3 = GlobalKey();

  List<dynamic> pendingOrdersList = [];

  List<dynamic> pickedOrdersList = [];

  List<dynamic> completedOrdersList = [];

  FetchPendingOrdersModel? fetchPendingOrdersModel;
  FetchPickedOrdersModel? fetchPickedOrdersModel;
  FetchCompletedOrdersModel? fetchCompletedOrdersModel;

  Future<void> refreshAvailableOrders() async {
    // await Future.delayed(const Duration(seconds: 1)) ;
    // await CacheHelper().saveData(key: 'sendToken', value: true);
    // refreshTabKey1.currentState?.show();
    await fetchPendingOrders();
    update();
  }

  Future<void> refreshPickedOrders() async {
    // print('picked +++++++++++++++++++++++++++++++++');
    await fetchPickedOrders();
    update();
  }

  Future<void> refreshCompletedOrders() async {
    // await Future.delayed(const Duration(seconds: 1)) ;
    // await CacheHelper().saveData(key: 'sendToken', value: true);
    await fetchCompletedOrders();
    update();
  }

  ///todo fetch pending orders
  fetchPendingOrders() async {
    try {
      ///to trigger refresh
      refreshTabKey1.currentState?.show();
      await CacheHelper().saveData(key: 'sendToken', value: true);
      final response = await api.get(
        'http://10.0.2.2:8000/api/orders/pending',
      );
      if (CacheHelper().getData(key: 'statusCode') == 200) {
        fetchPendingOrdersModel = FetchPendingOrdersModel.fromJson(response);
        pendingOrdersList = fetchPendingOrdersModel!.data;
        // print('++++++++++++++++++++++++++++++++++++++++++++++++++++++');
        // print(fetchPendingOrdersModel!.data[0].id);
        // print(fetchPendingOrdersModel!.data[0].user.phone);
        CacheHelper().removeData(key: 'statusCode');
      }
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
    }
    update();
  }

  ///todo pick delivery
  pickDelivery(int id) async {
    try {
      await CacheHelper().saveData(key: 'sendToken', value: true);
      // int id = await CacheHelper().getData(key: 'orderId');
      final response =
          await api.post('http://10.0.2.2:8000/api/orders/accept/$id');
      if (CacheHelper().getData(key: 'statusCode') == 200) {
        signStatus.signSuccess('picked delivery id $id', 'done');
        CacheHelper().removeData(key: 'statusCode');
        // print('++++++++++++++++++++++++++${CacheHelper().getData(key: 'orderID')}');
        // CacheHelper().removeData(key: 'orderId');
        await refreshAvailableOrders();
      }
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
    }
    update();
  }

  ///todo fetch picked Orders
  fetchPickedOrders() async {
    try {
      ///to trigger refresh
      refreshTabKey2.currentState?.show();
      await CacheHelper().saveData(key: 'sendToken', value: true);
      final response = await api.get(
        'http://10.0.2.2:8000/api/orders/current',
      );
      if (CacheHelper().getData(key: 'statusCode') == 200) {
        fetchPickedOrdersModel = FetchPickedOrdersModel.fromJson(response);
        pickedOrdersList = fetchPickedOrdersModel!.data;
        // print('++++++++++++++++++++++++++++++++++++++++++++++++++++++');
        // print(fetchPendingOrdersModel!.data[0].id);
        // print(fetchPendingOrdersModel!.data[0].user.phone);
        CacheHelper().removeData(key: 'statusCode');
      }
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
    }
    update();
  }

  ///todo complete order
  completeDelivery(int id) async {
    try {
      await CacheHelper().saveData(key: 'sendToken', value: true);
      // int id = await CacheHelper().getData(key: 'orderId');
      await api.post('http://10.0.2.2:8000/api/orders/complete/$id');
      if (CacheHelper().getData(key: 'statusCode') == 200) {
        signStatus.signSuccess('picked delivery id $id', 'done');
        CacheHelper().removeData(key: 'statusCode');
        // print('++++++++++++++++++++++++++${CacheHelper().getData(key: 'orderID')}');
        // CacheHelper().removeData(key: 'orderId');
        await refreshPickedOrders();
      }
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
    }
    update();
  }

  ///todo fetch completed Orders
  fetchCompletedOrders() async {
    try {
      ///to trigger refresh
      refreshTabKey3.currentState?.show();
      await CacheHelper().saveData(key: 'sendToken', value: true);
      final response = await api.get(
        'http://10.0.2.2:8000/api/orders/complete',
      );
      if (CacheHelper().getData(key: 'statusCode') == 200) {
        fetchCompletedOrdersModel = FetchCompletedOrdersModel.fromJson(response);
        completedOrdersList = fetchCompletedOrdersModel!.data;
        // print('++++++++++++++++++++++++++++++++++++++++++++++++++++++');
        // print(fetchPendingOrdersModel!.data[0].id);
        // print(fetchPendingOrdersModel!.data[0].user.phone);
        CacheHelper().removeData(key: 'statusCode');
      }
    } on ServerExceptions catch (e) {
      SignFailed(errorMessage: e.errorModel.message);
    }
    update();
  }
}
