class AddOrder {
  final int status;

  final String message;

  AddOrder({required this.status, required this.message});

  factory AddOrder.fromJson(Map<String, dynamic> jsonData) {
    return AddOrder(
        status: jsonData['status'],
        message: jsonData['message']);
  }
}
