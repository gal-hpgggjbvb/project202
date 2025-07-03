class OrderErrorModel {

  final String message ;

  OrderErrorModel({required this.message});
  factory OrderErrorModel.fromJson(Map<String , dynamic> jsonData){
    return OrderErrorModel(
      message: jsonData['message'] ,
    ) ;
  }
}