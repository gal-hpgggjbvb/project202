import 'package:dio/dio.dart';
import 'package:project2/api/api_consumer.dart';
import 'package:project2/api/api_interceptors.dart';
import 'package:project2/api/end_points.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/model/errors/exceptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    //to make one time used base url (Version1)
    // dio.options.baseUrl = "https://food-api-omega.vercel.app/api/v1/" ;

    //to make one time used base url (V2)
    // dio.options.baseUrl = EndPoint.baseUrl ;
    // dio.options.baseUrl = "http://10.0.2.2:8000/api/" ;

    //to add my interceptor
    dio.interceptors.add(ApiInterceptor()) ;

    // here send token
    // String tok = CacheHelper().getData(key: 'token') ;
    // dio.options.headers['Authorization'] = "Bearer $tok" ;

    //to print my request info
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        //to send data in parameters or json
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      CacheHelper().saveData(key: 'StatusCode', value: response.statusCode) ;
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
  @override
  Future put(
      String path, {
        data,
        Map<String, dynamic>? queryParameters,
        bool isFormData = false,
      }) async {
    try {
      final response = await dio.put(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}

//todo the final working code
// import 'package:dio/dio.dart';
// import 'package:project2/api/api_consumer.dart';
// import 'package:project2/api/api_interceptors.dart';
// import 'package:project2/api/end_points.dart';
// import 'package:project2/cache/cache_helper.dart';
// import 'package:project2/model/errors/exceptions.dart';
//
// class DioConsumer extends ApiConsumer {
//   final Dio dio;
//
//   DioConsumer({required this.dio}) {
//     //to make one time used base url (Version1)
//     // dio.options.baseUrl = "https://food-api-omega.vercel.app/api/v1/" ;
//
//     //to make one time used base url (V2)
//     // dio.options.baseUrl = EndPoint.baseUrl ;
//     // dio.options.baseUrl = "http://10.0.2.2:8000/api/" ;
//
//     //to add my interceptor
//     dio.interceptors.add(ApiInterceptor()) ;
//
//     // here send token
//     // String tok = CacheHelper().getData(key: 'token') ;
//     // dio.options.headers['Authorization'] = "Bearer $tok" ;
//
//     //to print my request info
//     dio.interceptors.add(LogInterceptor(
//       request: true,
//       requestHeader: true,
//       requestBody: true,
//       responseHeader: true,
//       responseBody: true,
//       error: true,
//     ));
//   }
//
//   @override
//   Future get(
//     String path, {
//     Object? data,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     try {
//       final response = await dio.get(
//         path,
//         data: data,
//         queryParameters: queryParameters,
//       );
//       return response.data;
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//     }
//   }
//
//   @override
//   Future post(
//     String path, {
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//     bool isFormData = false,
//   }) async {
//     try {
//       final response = await dio.post(
//         path,
//         //to send data in parameters or json
//         data: isFormData ? FormData.fromMap(data) : data,
//         queryParameters: queryParameters,
//       );
//       return response.data;
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//     }
//   }
//
//   @override
//   Future patch(
//     String path, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     bool isFormData = false,
//   }) async {
//     try {
//       final response = await dio.patch(
//         path,
//         data: isFormData ? FormData.fromMap(data) : data,
//         queryParameters: queryParameters,
//       );
//       return response.data;
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//     }
//   }
//
//   @override
//   Future delete(
//     String path, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     bool isFormData = false,
//   }) async {
//     try {
//       final response = await dio.delete(
//         path,
//         data: isFormData ? FormData.fromMap(data) : data,
//         queryParameters: queryParameters,
//       );
//       return response.data;
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//     }
//   }
// }
