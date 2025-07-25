import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/api/api_consumer.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/controller/auth/sign_status.dart';
import 'package:project2/model/errors/error_model.dart';
import 'package:project2/model/errors/exceptions.dart';

import '../../model/user/order/add_order_model.dart';

class OrderController extends GetxController {
  final ApiConsumer api;

  OrderController(this.api);
  // var formData = FormData.fromMap({
  //   'order_name': 'mobile',
  //   'source': 'homs',
  //   'destination': 'lattakia',
  // });
  // FormData formData = FormData() ;
  GlobalKey<ScaffoldState> scaffoldKey =GlobalKey();

  //order form key
  GlobalKey<FormState> orderFormKey = GlobalKey() ;
  //order object name
  TextEditingController objectNameController = TextEditingController();
  //source name from where
  TextEditingController sourceController = TextEditingController();
  //destination name to where
  TextEditingController destinationController = TextEditingController();

    bool order = false ;
    AddOrder? addOrder ;
    ErrorModel? errorModel ;
    makeOrder() async {
      // print('*******************1 here*****************') ;
      try {
        final response = await api.post("http://10.0.2.2:8000/api/store_order",
        isFormData: true ,
          // data: {
          //   'order_name': 'something',
          //   'source': 'place1',
          //   'destination': 'place2',
          // }
          data: {
            'order_name': objectNameController.text,
            'source': sourceController.text,
            'destination': destinationController.text,
          }
        );
        if(CacheHelper().getData(key: 'statusCode') == 200){
          // print('*******************2 here*****************') ;
          print(await CacheHelper().getData(key:'StatusCode')) ;
          addOrder = AddOrder.fromJson(response) ;
          print('status ${addOrder!.status}');
          print(addOrder!.message);
          // print('*******************3 here*****************') ;

          // print(response) ;

          // CacheHelper().saveData(key: 'orderMessage', value: orderModel?.message);
          // print(CacheHelper().getData(key: 'orderMessage')) ;
          SignStatus().signSuccess('order added successfully', '') ;
          CacheHelper().removeData(key: 'statusCode');
        }

      } on ServerExceptions catch (e) {
          // print('Error status code: ${e.response?.statusCode}');
          // print('Error data: ${e.response?.data}');
        // print('*******************something2 here*****************') ;
        SignFailed(errorMessage: e.errorModel.message) ;
        // print('*******************something3 here*****************') ;
        print(e.toString()) ;
      }
      update();
    }
}

// makeOrder() async {
//   String? tok = await CacheHelper().getData(key: 'token');
//   try {
//     print('*******************trying1*****************') ;
//     final dio = Dio(
//         // BaseOptions(
//         //   connectTimeout: Duration(seconds: 50),
//         //   responseType: ResponseType.json,
//         //   // contentType: ContentType.json.toString(),
//         //   )
//     );
//     // dio.interceptors.add(InterceptorsWrapper(
//     //   onRequest: (options , handler) async{
//     //     options.headers['Authorization'] = "Bearer $tok" ;
//     //   }
//     // ));
//
//     dio.options.headers["Authorization"] = "Bearer $tok";
//     dio.options.headers["Accept"] = "application/json" ;
//     print('*******************trying2*****************') ;
//     final response = await dio.post('http://10.0.2.2:8000/api/store_order' , data: {
//       'order_name': 'mobile',
//         'source': 'homssss',
//         'destination': 'lattakia',
//     });
//     print(response) ;
//     print('*******************success here*************') ;
//   } catch (e) {
//     print('******************here error*****************');
//     print(e.toString()) ;
//   }
// }

// makeOrder() async {
//   try {
//     print('*******************trying*****************') ;
//     final response = await api.post("http://10.0.2.2:8000/api/store_order",
//         isFormData: true,
//         data: {
//           'order_name': 'mobile',
//           'source': 'homs',
//           'destination': 'lattakia',
//         });
//     print(response) ;
//   } catch (e) {
//     print('******************here error*****************');
//     print(e.toString()) ;
//   }
// }

// makeOrder() async {
//   String? tok = await CacheHelper().getData(key: 'token');
//   try {
//     print('*******************trying1*****************') ;
//     final dio = Dio(
//       // BaseOptions(
//       //   connectTimeout: Duration(seconds: 50),
//       //   responseType: ResponseType.json,
//       //   // contentType: ContentType.json.toString(),
//       //   )
//     );
//     // dio.interceptors.add(InterceptorsWrapper(
//     //   onRequest: (options , handler) async{
//     //     options.headers['Authorization'] = "Bearer $tok" ;
//     //   }
//     // ));
//     print('*******************trying2*****************') ;
//     dio.options.headers["Authorization"] = "Bearer $tok";
//     final response = await dio.post('http://10.0.2.2:8000/api/store_order' , data: {
//       'order_name': 'mobile',
//       'source': 'homssss',
//       'destination': 'lattakia',
//     });
//     print(response) ;
//     print('*******************success here*************') ;
//   } catch (e) {
//     print('******************here error*****************');
//     print(e.toString()) ;
//   }
// }

// makeOrder() async {
//   try {
//     print('*******************trying1*****************') ;
//     // CacheHelper().saveData(key: 'order', value: order);
//     String tok = await CacheHelper().getData(key: 'token');
//     print('*******************trying2*****************') ;
//     // Dio().options.headers['Authorization'] = 'Bearer $tok';
//     Options options = Options(
//         headers: {
//           'Authorization': 'Bearer $tok',
//         }
//     ) ;
//     print(tok) ;
//     print('*******************trying3*****************') ;
//     final response = await api.post("http://10.0.2.2:8000/api/store_order",
//         isFormData: true ,
//         data: {
//           'order_name': 'mobile',
//           'source': 'place1',
//           'destination': 'place2',
//         }
//     ) ;
//     print('*******************something here*****************') ;
//     // print(response.statusCode) ;
//     print(response) ;
//   }catch (e) {
//     print(e.toString()) ;
//   }
//   }

//todo worked
// makeOrder() async {
//
//   String tok = await CacheHelper().getData(key: 'token');
//   print('*******************trying token*****************') ;
//   Dio().options.headers['Authorization'] = 'Bearer $tok';
//   print(tok) ;
//   try {
//     print('*******************trying1*****************') ;
//     // CacheHelper().saveData(key: 'order', value: order);
//     // Options options = Options(
//     //   headers: {
//     //     'Authorization': 'Bearer $tok',
//     //   }
//     // ) ;
//
//     print('*******************trying2*****************') ;
//     final response = await api.post("http://10.0.2.2:8000/api/store_order",
//         isFormData: true ,
//         data: {
//           'order_name': 'something',
//           'source': 'place1',
//           'destination': 'place2',
//         }
//     ) ;
//     print('*******************something here*****************') ;
//     // print(response.statusCode) ;
//     print(response) ;
//     // CacheHelper().saveData(key: 'orderMessage', value: orderModel?.message);
//     // print(CacheHelper().getData(key: 'orderMessage')) ;
//   }on ServerExceptions catch (e) {
//     print(e.toString()) ;
//   }
// }