import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project2/api/dio_consumer.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/controller/delivery_man_controller/available_orders_controller.dart';

import '../functions/add_space.dart';

class DeliveryExpTile extends StatelessWidget {
  final String leading;

  final String title;

  final String trailing;

  final int id;

  final String orderName;

  final String source;

  final String destination;

  final String status;

  final DateTime created;
  final DateTime? updated;

  final int? userId;
  final String? userName;
  final String? userPhone;

  final bool? pendingButton;
  final bool? progressButton;

  // final bool? completeButton;

  // final String? buttonText;
  // final Color? buttonColor;
  // final VoidCallback? onPressed;

  DeliveryExpTile({
    super.key,
    required this.leading,
    required this.title,
    required this.trailing,
    required this.id,
    required this.orderName,
    required this.source,
    required this.destination,
    required this.status,
    required this.created,
    this.updated,
    this.userId,
    this.userName,
    this.userPhone,
    this.pendingButton = false,
    this.progressButton = false,
    // this.completeButton = false,

    // this.buttonText,
    // this.buttonColor,
    // this.onPressed,
  });

  AvailableOrdersController availableOrdersController =
      Get.put(AvailableOrdersController(DioConsumer(dio: Dio())));

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10.0, right: 5.0, left: 5.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: ExpansionTile(
        leading: Text(
          orderName.length > 7
              // ? '   Order Name: \n   ${orderName.substring(0, 7)}..'
              // : '   Order Name: \n   $orderName',
              ? '${'order_name1'.tr}\n   ${title.substring(0, 7)}..'
              : '${'order_name1'.tr}\n   $title',
          style: TextStyle(
            fontFamily: "Satoshi",
            color: context.theme.colorScheme.primary,
            fontSize: 15,
            fontWeight: FontWeight.normal, // typing style
          ),
        ),
        title: Text(
          source.length > 7
              // ? '   Source: \n   ${source.substring(0, 7)}..'
              // : '   Source: \n   $source',
              ? '${'source1'.tr}\n   ${title.substring(0, 7)}..'
              : '${'source1'.tr}\n   $title',
          style: TextStyle(
            fontFamily: "Satoshi",
            color: context.theme.colorScheme.primary,
            fontSize: 15,
            fontWeight: FontWeight.normal, // typing style
          ),
        ),
        trailing: Text(
          destination.length > 7
              // ? '   Destination: \n   ${destination.substring(0, 7)}..'
              // : '   Destination: \n   $destination',
              ? '${'destination1'.tr}\n   ${title.substring(0, 7)}..'
              : '${'destination1'.tr}\n   $title',
          style: TextStyle(
            fontFamily: "Satoshi",
            color: context.theme.colorScheme.primary,
            fontSize: 15,
            fontWeight: FontWeight.normal, // typing style
          ),
        ),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///todo id
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: CacheHelper().getData(key: 'language') == 'ar' ?
                    const EdgeInsets.only(right: 50.0) :
                    const EdgeInsets.only(left: 50.0),
                    child: Text(
                      // 'OrderId :           ',
                      'order_id2'.tr,
                      // style: context.textTheme.displaySmall,
                      style: TextStyle(
                        fontFamily: "Satoshi",
                        color: context.theme.colorScheme.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.normal, // typing style
                      ),
                    ),
                  ),
                  Text(
                    '$id',
                    // style: context.textTheme.displaySmall,
                    style: TextStyle(
                      fontFamily: "Satoshi",
                      color: context.theme.colorScheme.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.normal, // typing style
                    ),
                  ),
                ],
              ),
              addVerticalSpace(7),

              ///todo order name
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: CacheHelper().getData(key: 'language') == 'ar' ?
                    const EdgeInsets.only(right: 50.0) :
                    const EdgeInsets.only(left: 50.0),
                    child: Text(
                      // 'OrderName :     ',
                      'order_name2'.tr,
                      // style: context.textTheme.displaySmall,
                      style: TextStyle(
                        fontFamily: "Satoshi",
                        color: context.theme.colorScheme.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.normal, // typing style
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    orderName,
                    style: context.textTheme.displaySmall,
                    // softWrap: true,
                    //   overflow: TextOverflow.visible,
                    //   maxLines: null,
                  )),
                ],
              ),
              addVerticalSpace(7),

              ///todo source name
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: CacheHelper().getData(key: 'language') == 'ar' ?
                    const EdgeInsets.only(right: 50.0) :
                    const EdgeInsets.only(left: 50.0),
                    child: Text(
                      // 'Source :            ',
                      'source'.tr,
                      // style: context.textTheme.displaySmall,
                      style: TextStyle(
                        fontFamily: "Satoshi",
                        color: context.theme.colorScheme.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.normal, // typing style
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    source,
                    // style: context.textTheme.displaySmall,
                    style: TextStyle(
                      fontFamily: "Satoshi",
                      color: context.theme.colorScheme.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.normal, // typing style
                    ),
                  )),
                ],
              ),
              addVerticalSpace(7),

              ///todo destination name
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: CacheHelper().getData(key: 'language') == 'ar' ?
                    const EdgeInsets.only(right: 50.0) :
                    const EdgeInsets.only(left: 50.0),
                    child: Text(
                      // 'Destination :      ',
                      'destination'.tr,
                      // style: context.textTheme.displaySmall,
                      style: TextStyle(
                        fontFamily: "Satoshi",
                        color: context.theme.colorScheme.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.normal, // typing style
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    destination,
                    style: context.textTheme.displaySmall,
                  )),
                ],
              ),
              addVerticalSpace(7),

              ///todo createdat
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: CacheHelper().getData(key: 'language') == 'ar' ?
                    const EdgeInsets.only(right: 50.0) :
                    const EdgeInsets.only(left: 50.0),
                    child: Text(
                      // 'Createdat :        ',
                      'created'.tr,
                      // style: context.textTheme.displaySmall,
                      style: TextStyle(
                        fontFamily: "Satoshi",
                        color: context.theme.colorScheme.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.normal, // typing style
                      ),
                    ),
                  ),
                  Text(
                    '$created',
                    style: context.textTheme.displaySmall,
                  ),
                ],
              ),

              if(updated != null)
              addVerticalSpace(7),
              ///todo updatedat
              if(updated != null)
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: CacheHelper().getData(key: 'language') == 'ar' ?
                    const EdgeInsets.only(right: 50.0) :
                    const EdgeInsets.only(left: 50.0),
                    child: Text(
                      // 'Updatedat :       ',
                      'updated'.tr,
                      // style: context.textTheme.displaySmall,
                      style: TextStyle(
                        fontFamily: "Satoshi",
                        color: context.theme.colorScheme.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.normal, // typing style
                      ),
                    ),
                  ),
                  Text(
                    '$updated',
                    style: context.textTheme.displaySmall,
                  ),
                ],
              ),
              addVerticalSpace(7),

              if (userId != null) addVerticalSpace(10),
              if (userId != null)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(),
                ),

              ///todo user id optional
              if (userId != null)
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: CacheHelper().getData(key: 'language') == 'ar' ?
                      const EdgeInsets.only(right: 50.0) :
                      const EdgeInsets.only(left: 50.0),
                      child: Text(
                        // 'Customer ID :              ',
                        'customer_id'.tr,
                        // style: context.textTheme.displaySmall,
                        style: TextStyle(
                          fontFamily: "Satoshi",
                          color: context.theme.colorScheme.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.normal, // typing style
                        ),
                      ),
                    ),
                    Text(
                      '$userId',
                      style: context.textTheme.displaySmall,
                    ),
                  ],
                ),
              if (userId != null) addVerticalSpace(7),

              ///todo user name optional
              if (userId != null)
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: CacheHelper().getData(key: 'language') == 'ar' ?
                      const EdgeInsets.only(right: 50.0) :
                      const EdgeInsets.only(left: 50.0),
                      child: Text(
                        // 'Customer Name :        ',
                        'customer_name'.tr,
                        // style: context.textTheme.displaySmall,
                        style: TextStyle(
                          fontFamily: "Satoshi",
                          color: context.theme.colorScheme.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.normal, // typing style
                        ),
                      ),
                    ),
                    Text(
                      userName!,
                      style: context.textTheme.displaySmall,
                    ),
                  ],
                ),
              if (userId != null) addVerticalSpace(7),

              ///todo user phone optional
              if (userId != null)
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: CacheHelper().getData(key: 'language') == 'ar' ?
                      const EdgeInsets.only(right: 50.0) :
                      const EdgeInsets.only(left: 50.0),
                      child: Text(
                        // 'Customer Phone :       ',
                        'customer_phone'.tr,
                        // style: context.textTheme.displaySmall,
                        style: TextStyle(
                          fontFamily: "Satoshi",
                          color: context.theme.colorScheme.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.normal, // typing style
                        ),
                      ),
                    ),
                    Text(
                      userPhone!,
                      style: context.textTheme.displaySmall,
                    ),
                    Padding(
                      padding: CacheHelper().getData(key: 'language') == 'ar' ?
                      const EdgeInsets.only(right: 50.0) :
                      const EdgeInsets.only(left: 50.0),
                      child: GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: userPhone!));
                          Get.snackbar("Copied", "phone number copied");
                        },
                        child: Icon(
                          Icons.copy,
                          color: Colors.grey.shade500,
                          size: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              if (userId != null) addVerticalSpace(7),

              addVerticalSpace(10),
              if (userId == null)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(),
                ),

              ///todo pick button
              if (pendingButton!)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //todo pick delivery button
                    MaterialButton(
                      onPressed: () async {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          dismissOnTouchOutside: true,
                          // title: 'Pick Order $id ?',
                          title: '${'pick_order'.tr}$id${'question_mark'.tr} ',
                          titleTextStyle: TextStyle(
                            fontFamily: "Satoshi",
                            color: context.theme.colorScheme.onSecondary,
                            fontSize: 17,
                            fontWeight: FontWeight.normal, // typing style
                          ),
                          dialogBackgroundColor:
                              context.theme.primaryColorLight,
                          dialogBorderRadius: BorderRadius.circular(30),
                          btnOkText: 'ok'.tr,
                          btnCancelText: 'cancel'.tr,
                          buttonsTextStyle: const TextStyle(
                            fontFamily: "Satoshi",
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500, // typing style
                          ),
                          btnCancelOnPress: () {},
                          btnOkOnPress: () async {
                            // await CacheHelper().saveData(key: 'orderId', value: id);
                            await availableOrdersController.pickDelivery(id);
                          },
                        ).show();
                        // await CacheHelper().saveData(key: 'orderId', value: id);
                        // await availableOrdersController.pickDelivery(id);
                      },
                      // color: Colors.blue,
                      padding: const EdgeInsets.all(5),
                      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      minWidth: 5,
                      height: 10,
                      child: Text(
                        // "Pick Delivery",
                        "pick_order".tr,
                        style: const TextStyle(
                          fontFamily: "Satoshi",
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.w500, // typing style
                        ),
                        // style: TextStyle(
                        //     color: Colors.blue,
                        //     fontSize: 15,
                        //     fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              addVerticalSpace(5),

              ///todo progress order buttons
              if (progressButton!)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(),
                ),
              if (progressButton!)
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //todo complete button
                    MaterialButton(
                      onPressed: () async {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          dismissOnTouchOutside: true,
                          // title: 'Complete Order $id ?',
                          title: '${'complete_order'.tr}$id${'question_mark'.tr} ',
                          titleTextStyle: TextStyle(
                            fontFamily: "Satoshi",
                            color: context.theme.colorScheme.onSecondary,
                            fontSize: 17,
                            fontWeight: FontWeight.normal, // typing style
                          ),
                          dialogBackgroundColor:
                              context.theme.primaryColorLight,
                          dialogBorderRadius: BorderRadius.circular(30),
                          btnOkText: 'ok'.tr,
                          btnCancelText: 'cancel'.tr,
                          buttonsTextStyle: const TextStyle(
                            fontFamily: "Satoshi",
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500, // typing style
                          ),
                          btnCancelOnPress: () {},
                          btnOkOnPress: () async {
                            await CacheHelper()
                                .saveData(key: 'orderId', value: id);
                            await availableOrdersController.completeDelivery(id);
                          },
                        ).show();
                        // await CacheHelper().saveData(key: 'orderId', value: id);
                        // await availableOrdersController.pickDelivery(id);
                      },
                      // color: Colors.blue,
                      padding: const EdgeInsets.all(5),
                      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      minWidth: 5,
                      height: 10,
                      child: Text(
                        "complete_order".tr,
                        style: const TextStyle(
                          fontFamily: "Satoshi",
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.w500, // typing style
                        ),
                      ),
                    ),
                    //todo cancel button
                    MaterialButton(
                      onPressed: () async {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          dismissOnTouchOutside: true,
                          // title: 'Cancel Order $id ?',
                          title: '${'cancel_order'.tr}$id${'question_mark'.tr} ',
                          titleTextStyle: TextStyle(
                            fontFamily: "Satoshi",
                            color: context.theme.colorScheme.onSecondary,
                            fontSize: 17,
                            fontWeight: FontWeight.normal, // typing style
                          ),
                          dialogBackgroundColor:
                          context.theme.primaryColorLight,
                          dialogBorderRadius: BorderRadius.circular(30),
                          btnOkText: 'ok'.tr,
                          btnCancelText: 'cancel'.tr,
                          buttonsTextStyle: const TextStyle(
                            fontFamily: "Satoshi",
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500, // typing style
                          ),
                          btnCancelOnPress: () {},
                          btnOkOnPress: () async {
                            // await CacheHelper().saveData(key: 'orderId', value: id);
                            await availableOrdersController.cancelDelivery(id);
                          },
                        ).show();
                        // await CacheHelper().saveData(key: 'orderId', value: id);
                        // await availableOrdersController.pickDelivery(id);
                      },
                      // color: Colors.blue,
                      padding: const EdgeInsets.all(5),
                      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      minWidth: 5,
                      height: 10,
                      child: Text(
                        "cancel_order".tr,
                        style: const TextStyle(
                          fontFamily: "Satoshi",
                          color: Colors.redAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.w500, // typing style
                        ),
                      ),
                    ),
                  ],
                ),
              // Text('data'),
              // Text('data'),
              // Text('data'),
            ],
          ),
        ],
      ),
    );
  }
}
