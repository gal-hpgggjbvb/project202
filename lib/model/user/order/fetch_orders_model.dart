class FetchOrdersModel {
  final int status;

  final String message;
  final List<Orders> orders;

  FetchOrdersModel(
      {required this.status, required this.message, required this.orders});

  factory FetchOrdersModel.fromJson(Map<String, dynamic> jsonData) {
    return FetchOrdersModel(
      status: jsonData['status'],
      message: jsonData['message'],
      // orders: Orders.fromJson(jsonData['orders']) ,
      orders: List<Orders>.from(
        jsonData['orders'].map((order) => Orders.fromJson(order)),
      ),
    );
  }
}

class Orders {
  final int id;
  final int userId;
  final int? driverId;
  final String orderName;
  final String source;
  final String destination;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Orders(
      {required this.id,
      required this.userId,
      required this.driverId,
      required this.orderName,
      required this.source,
      required this.destination,
      required this.status,
      required this.createdAt,
      required this.updatedAt});

  factory Orders.fromJson(Map<String, dynamic> jsonData) {
    return Orders(
      id: jsonData['id'],
      userId: jsonData['user_id'],
      driverId: jsonData['driver_id'],
      orderName: jsonData['order_name'],
      source: jsonData['source'],
      destination: jsonData['destination'],
      status: jsonData['status'],
      createdAt: DateTime.parse(jsonData['created_at']),
      updatedAt: DateTime.parse(jsonData['updated_at']),
    );
  }
  //todo added this method to solve instance of orders issue
  @override
  String toString() {
    return 'Order(id: $id, orderName: $orderName, source: $source, destination: $destination, status: $status)';
  }


}
