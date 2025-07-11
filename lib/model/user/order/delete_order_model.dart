class DeleteOrderModel {
  final int status;

  final String message;

  DeleteOrderModel({required this.status, required this.message});

  factory DeleteOrderModel.fromJson(Map<String, dynamic> jsonData) {
    return DeleteOrderModel(
        status: jsonData['status'],
        message: jsonData['message']);
  }
}
