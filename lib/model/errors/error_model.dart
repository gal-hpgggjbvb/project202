import 'package:project2/cache/cache_helper.dart';

class ErrorModel{
  final int status ;
  final String message ;

  ErrorModel({required this.status, required this.message});
  //to convert json to model
  factory ErrorModel.fromJson(Map<String,dynamic> jsonData) {
    CacheHelper().saveData(key: 'status', value: jsonData['status']) ;
    CacheHelper().saveData(key: 'message', value: jsonData['message']) ;
    return ErrorModel(
        status: jsonData['status'],
        message: jsonData['message'] ,
    ) ;
  }
}

// class ErrorModel{
//   final int status ;
//   final String error ;
//
//   ErrorModel({required this.status, required this.error});
//   //to convert json to model
//   factory ErrorModel.fromJson(Map<String,dynamic> jsonData) {
//     return ErrorModel(
//         status: jsonData['status'],
//         error: jsonData['error'] ,
//     ) ;
//   }
// }