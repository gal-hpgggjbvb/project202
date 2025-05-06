import 'package:dio/dio.dart';
import 'package:project2/api/api_consumer.dart';
import 'package:project2/model/errors/exeptions.dart';

class DioConsumer extends ApiConsumer{
  final Dio dio ;

  DioConsumer(this.dio);

  @override
  Future get(String path,
      {data, Map<String, dynamic>? queryParameters}) async{
    try {
      final response = await dio.get(
        path ,
        data: data ,
        queryParameters: queryParameters ,
      ) ;
      return response.data ;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(String path,
      {data, Map<String, dynamic>? queryParameters}) async{
    try {
      final response = await dio.post(
        path ,
        data: data ,
        queryParameters: queryParameters ,
      ) ;
      return response.data ;
    } on DioException catch(e){
      handleDioExceptions(e) ;
    }
  }

  @override
  Future patch(String path,
      {data, Map<String, dynamic>? queryParameters}) async{
    try{
      final response = await dio.patch(
        path ,
        data: data ,
        queryParameters: queryParameters ,
      ) ;
      return response.data ;
    }
    on DioException catch(e){
      handleDioExceptions(e) ;
    }
  }

  @override
  Future delete(String path,
      {data, Map<String, dynamic>? queryParameters}) async{
    try{
      final response = await dio.delete(
        path ,
        data: data ,
        queryParameters: queryParameters ,
      ) ;
      return response.data ;
    }
    on DioException catch(e){
      handleDioExceptions(e) ;
    }
  }

}