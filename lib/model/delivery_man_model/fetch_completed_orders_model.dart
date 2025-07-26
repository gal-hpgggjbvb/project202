class FetchCompletedOrdersModel {
  final int status;
  final String message;
  final List<OrderData> data;

  FetchCompletedOrdersModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FetchCompletedOrdersModel.fromJson(Map<String, dynamic> json) {
    return FetchCompletedOrdersModel(
      status: json['status'],
      message: json['message'],
      data: List<OrderData>.from(
        json['data'].map((order) => OrderData.fromJson(order)),
      ),
    );
  }
}
class OrderData {
  final int id;
  final int userId;
  final int driverId;
  final String orderName;
  final String source;
  final String destination;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final OrderUser user;

  OrderData({
    required this.id,
    required this.userId,
    required this.driverId,
    required this.orderName,
    required this.source,
    required this.destination,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      id: json['id'],
      userId: json['user_id'],
      driverId: json['driver_id'],
      orderName: json['order_name'],
      source: json['source'],
      destination: json['destination'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      user: OrderUser.fromJson(json['user']),
    );
  }
}
class OrderUser {
  final int id;
  final String name;
  final String phone;

  OrderUser({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory OrderUser.fromJson(Map<String, dynamic> json) {
    return OrderUser(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}
