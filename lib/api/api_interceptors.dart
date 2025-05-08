import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor{

  @override //what to do on request like header or something else
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //to add something in header with the request
    //options.headers['Accept-Language'] = 'en' ;
    super.onRequest(options, handler);
  }

}