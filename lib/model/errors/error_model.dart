class ErrorModel{
  final int status ;
  final String error ;

  ErrorModel({required this.status, required this.error});
  //to convert json to model
  factory ErrorModel.fromJson(Map<String,dynamic> jsonData) {
    return ErrorModel(
        status: jsonData['status'],
        error: jsonData['error'] ,
    ) ;
  }
}