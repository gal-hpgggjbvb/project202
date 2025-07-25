class UserInProgressOrdersModel {
  final int status;
  final String message;
  final List<Order> orders;

  UserInProgressOrdersModel({
    required this.status,
    required this.message,
    required this.orders,
  });

  factory UserInProgressOrdersModel.fromJson(Map<String, dynamic> jsonData) {
    return UserInProgressOrdersModel(
      status: jsonData['status'],
      message: jsonData['message'],
      orders: List<Order>.from(jsonData['orders'].map((x) => Order.fromJson(x))),
    );
  }
}

class Order {
  final int id;
  final int userId;
  final int driverId;
  final String orderName;
  final String source;
  final String destination;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Driver driver;

  Order({
    required this.id,
    required this.userId,
    required this.driverId,
    required this.orderName,
    required this.source,
    required this.destination,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.driver,
  });

  factory Order.fromJson(Map<String, dynamic> jsonData) {
    return Order(
      id: jsonData['id'],
      userId: jsonData['user_id'],
      driverId: jsonData['driver_id'],
      orderName: jsonData['order_name'],
      source: jsonData['source'],
      destination: jsonData['destination'],
      status: jsonData['status'],
      createdAt: DateTime.parse(jsonData['created_at']),
      updatedAt: DateTime.parse(jsonData['updated_at']),
      driver: Driver.fromJson(jsonData['driver']),
    );
  }
}

class Driver {
  final int id;
  final String name;
  final String phone;

  Driver({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory Driver.fromJson(Map<String, dynamic> jsonData) {
    return Driver(
      id: jsonData['id'],
      name: jsonData['name'],
      phone: jsonData['phone'],
    );
  }
}
