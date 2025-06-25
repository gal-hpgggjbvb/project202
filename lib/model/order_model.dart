import '../cache/cache_helper.dart';

class OrderModel {
  final int status ;
  final String message ;
  final Order order ;

  OrderModel({required this.status, required this.message, required this.order});

  factory OrderModel.fromJson(Map<String , dynamic>jsonData){
    // CacheHelper().saveData(key: 'orderMessage', value: jsonData['message']) ;
    return OrderModel(
        status: jsonData['status'],
        message: jsonData['message'],
        order: jsonData['order'] ,
    ) ;
  }
}

class Order {
  final String orderName ;
  final String source ;
  final String destination ;
  final int userID ;
  final int driverID ;
  final String updated ;
  final String created ;
  final int id ;

  Order({required this.orderName, required this.source, required this.destination, required this.userID, required this.driverID, required this.updated, required this.created, required this.id});

}