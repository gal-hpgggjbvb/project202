class ErrorModel{
  final int status ;
  final String errorMessage ;

  ErrorModel({required this.status, required this.errorMessage});
  //to convert json to model
  factory ErrorModel.fromJson(Map<String,dynamic> jsonData) {
    return ErrorModel(
        status: jsonData['status'],
        errorMessage: jsonData['ErrorMessage'] ,
    ) ;
  }
}