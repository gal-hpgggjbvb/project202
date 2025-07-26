class FetchPickedOrdersModel {
  final int status;
  final String message;
  final List<PickedOrder> data;

  FetchPickedOrdersModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FetchPickedOrdersModel.fromJson(Map<String, dynamic> jsonData) {
    return FetchPickedOrdersModel(
      status: jsonData['status'],
      message: jsonData['message'],
      data: List<PickedOrder>.from(
        jsonData['data'].map((x) => PickedOrder.fromJson(x)),
      ),
    );
  }
}

class PickedOrder {
  final int id;
  final int userId;
  final int driverId;
  final String orderName;
  final String source;
  final String destination;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  PickedOrder({
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

  factory PickedOrder.fromJson(Map<String, dynamic> jsonData) {
    return PickedOrder(
      id: jsonData['id'],
      userId: jsonData['user_id'],
      driverId: jsonData['driver_id'],
      orderName: jsonData['order_name'],
      source: jsonData['source'],
      destination: jsonData['destination'],
      status: jsonData['status'],
      createdAt: DateTime.parse(jsonData['created_at']),
      updatedAt: DateTime.parse(jsonData['updated_at']),
      user: User.fromJson(jsonData['user']),
    );
  }
}

class User {
  final int id;
  final String name;
  final String phone;

  User({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(
      id: jsonData['id'],
      name: jsonData['name'],
      phone: jsonData['phone'],
    );
  }
}
