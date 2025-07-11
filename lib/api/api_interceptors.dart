import 'package:dio/dio.dart';
import 'package:project2/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor{

  @override //what to do on request like header or something else
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //to add something in header with the request
    // options.headers['Accept'] = 'application/json' ;
    // bool order = CacheHelper().getData(key: 'order') ;

    //todo send token via header
    if(CacheHelper().getData(key: 'sendToken') ?? false){
      print('h=**********api interceptors true ******************') ;
        String tok = CacheHelper().getData(key: 'token') ;
        options.headers['Authorization'] = "Bearer $tok" ;
        CacheHelper().saveData(key: 'orderBool', value: false) ;
    }

    // if(order){
    //   options.headers['Authorization'] = "Bearer $tok" ;
    //   CacheHelper().saveData(key: 'order', value: !order) ;
    // }
    super.onRequest(options, handler);
  }

}