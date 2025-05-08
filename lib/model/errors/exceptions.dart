// to take error model and show the error(exception)
import 'package:dio/dio.dart';
import 'package:project2/model/errors/error_model.dart';

class ServerExceptions implements Exception{

  final ErrorModel errorModel ;

  ServerExceptions({required this.errorModel});

}

void handleDioExceptions(DioException e) {
  switch(e.type){
    case DioExceptionType.connectionTimeout:
      throw ServerExceptions(
          errorModel: ErrorModel.fromJson(e.response!.data)) ;
    case DioExceptionType.sendTimeout:
      throw ServerExceptions(
          errorModel: ErrorModel.fromJson(e.response!.data)) ;
    case DioExceptionType.receiveTimeout:
      throw ServerExceptions(
          errorModel: ErrorModel.fromJson(e.response!.data)) ;
    case DioExceptionType.badCertificate:
      throw ServerExceptions(
          errorModel: ErrorModel.fromJson(e.response!.data)) ;
    case DioExceptionType.cancel:
      throw ServerExceptions(
          errorModel: ErrorModel.fromJson(e.response!.data)) ;
    case DioExceptionType.connectionError:
      throw ServerExceptions(
          errorModel: ErrorModel.fromJson(e.response!.data)) ;
    case DioExceptionType.unknown:
      throw ServerExceptions(
          errorModel: ErrorModel.fromJson(e.response!.data)) ;
    case DioExceptionType.badResponse: //todo: this exception means the request arrived server
      switch(e.response?.statusCode){
        case 400:   //bad request
          throw ServerExceptions(
              errorModel: ErrorModel.fromJson(e.response!.data)) ;
        case 401:   //unauthorized
          throw ServerExceptions(
              errorModel: ErrorModel.fromJson(e.response!.data)) ;
        case 403:   //forbidden
          throw ServerExceptions(
              errorModel: ErrorModel.fromJson(e.response!.data)) ;
        case 404:   //not found
          throw ServerExceptions(
              errorModel: ErrorModel.fromJson(e.response!.data)) ;
        case 409:   //cofficient
          throw ServerExceptions(
              errorModel: ErrorModel.fromJson(e.response!.data)) ;
        case 422:   //unprocesssble entity
          throw ServerExceptions(
              errorModel: ErrorModel.fromJson(e.response!.data)) ;
        case 504:   //bad request server exception
          throw ServerExceptions(
              errorModel: ErrorModel.fromJson(e.response!.data)) ;

      }
  }
}