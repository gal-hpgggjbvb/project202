class OrderModel {
  final int status;

  final String message;

  final Order order;

  OrderModel(
      {required this.status, required this.message, required this.order});

  factory OrderModel.fromJson(Map<String, dynamic> jsonData) {
    // CacheHelper().saveData(key: 'orderMessage', value: jsonData['message']) ;
    return OrderModel(
      status: jsonData['status'],
      message: jsonData['message'],
      order: Order.fromJson(jsonData['order']),
    );
  }
}

class Order {
  final String orderName;

  final String source;

  final String destination;

  final int userID;

  final int driverID;

  final DateTime updated;

  final DateTime created;

  final int id;

  Order(
      {required this.orderName,
      required this.source,
      required this.destination,
      required this.userID,
      required this.driverID,
      required this.updated,
      required this.created,
      required this.id});

  factory Order.fromJson(Map<String, dynamic> jsonData) {
    return Order(
        orderName: jsonData['order_name'],
        source: jsonData['source'],
        destination: jsonData['destination'],
        userID: jsonData['user_id'],
        driverID: jsonData['driver_id'] ?? 1,
        updated: DateTime.parse(jsonData['updated_at']),
        created: DateTime.parse(jsonData['created_at']),
        id: jsonData['id']);
  }
}
