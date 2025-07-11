class EditOrderModel {
  final int status;

  final String message;

  EditOrderModel({required this.status, required this.message});

  factory EditOrderModel.fromJson(Map<String, dynamic> jsonData) {
    return EditOrderModel(
        status: jsonData['status'],
        message: jsonData['message']);
  }
}
