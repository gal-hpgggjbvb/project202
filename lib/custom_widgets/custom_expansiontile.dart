import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project2/api/dio_consumer.dart';
import 'package:project2/cache/cache_helper.dart';
import 'package:project2/controller/user_controller/fetch_orders_controller.dart';
import 'package:project2/controller/user_controller/order_controller.dart';
import 'package:project2/custom_widgets/custom_order_field.dart';
import 'package:project2/functions/add_space.dart';

FetchOrdersController fetchOrdersController =
    Get.put(FetchOrdersController(DioConsumer(dio: Dio())));
OrderController orderController =
    Get.put(OrderController(DioConsumer(dio: Dio())));

class CustomExpansionTile extends StatelessWidget {
  final int leading;

  final String title;

  final String trailing;

  final int id;

  final String name;

  final String source;

  final String destination;

  final String status;

  final DateTime created;

  final DateTime? updated;

  final int? deliveryManId;
  final String? deliveryManName;
  final String? deliveryManPhone;

  final bool? buttons;

  const CustomExpansionTile({
    super.key,
    required this.leading,
    required this.title,
    required this.trailing,
    required this.id,
    required this.name,
    required this.source,
    required this.destination,
    required this.status,
    required this.created,
    this.updated,
    this.deliveryManId,
    this.deliveryManName,
    this.deliveryManPhone,
    this.buttons = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10.0, right: 5.0, left: 5.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: ExpansionTile(
        //on expansion shape
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        // collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        // collapsedBackgroundColor: Colors.orange.shade300,
        // collapsedBackgroundColor: Themes.customLightTheme.colorScheme.primary,
        // backgroundColor: Colors.deepOrange[50],
        leading: Text(
          // 'Order ID: $leading',
          '${'order_id1'.tr}$leading',
          //style: context.theme.textTheme.bodySmall,
          style: TextStyle(
            fontFamily: "Satoshi",
            color: context.theme.colorScheme.primary,
            fontSize: 15,
            fontWeight: FontWeight.normal, // typing style
          ),
        ),
        title: Text(
          title.length > 7
              // ? '   Order Name: \n   ${title.substring(0, 7)}..'
              // : '   Order Name: \n   $title',
              ? '${'order_name1'.tr}\n   ${title.substring(0, 7)}..'
              : '${'order_name1'.tr}\n   $title',
          style: TextStyle(
            fontFamily: "Satoshi",
            color: context.theme.colorScheme.primary,
            fontSize: 15,
            fontWeight: FontWeight.normal, // typing style
          ),
        ),
        trailing: Text(
          // 'Status : $trailing',
          '${'status1'.tr}$trailing',
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
              //todo id
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
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
              //todo order name
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
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
                    name,
                    style: context.textTheme.displaySmall,
                    // softWrap: true,
                    //   overflow: TextOverflow.visible,
                    //   maxLines: null,
                  )),
                ],
              ),
              addVerticalSpace(7),
              //todo source name
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
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
              //todo destination name
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
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
              //todo status
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
                      'status2'.tr,
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
                    status,
                    style: context.textTheme.displaySmall,
                  ),
                ],
              ),
              addVerticalSpace(7),
              //todo createdat
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
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
              if (updated != null) addVerticalSpace(7),

              ///todo updatedat
              if (updated != null)
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Text(
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
              addVerticalSpace(10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Divider(),
              ),
              if (deliveryManId != null) addVerticalSpace(10),

              ///todo delivery man info
              if (deliveryManId != null)
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Text(
                        // 'DeliveryMan ID :                   ',
                        'delivery_man_id'.tr,
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
                      '$deliveryManId',
                      style: context.textTheme.displaySmall,
                    ),
                  ],
                ),
              if (deliveryManId != null) addVerticalSpace(7),
              if (deliveryManId != null)
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Text(
                        // 'DeliveryMan Name :              ',
                        'delivery_man_name'.tr,
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
                      deliveryManName ?? 'not set',
                      style: context.textTheme.displaySmall,
                    ),
                  ],
                ),
              if (deliveryManId != null) addVerticalSpace(7),
              if (deliveryManId != null)
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Text(
                        // 'DeliveryMan Phone :             ',
                        'delivery_man_phone'.tr,
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
                      deliveryManPhone ?? 'not set',
                      style: context.textTheme.displaySmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0,right: 30),
                      child: GestureDetector(
                        onTap: () {
                          Clipboard.setData(
                              ClipboardData(text: deliveryManPhone!));
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
              if (deliveryManId != null) addVerticalSpace(7),
              //todo buttons
              buttons!
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //todo edit button
                        MaterialButton(
                          onPressed: () async {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                builder: (context) => Padding(
                                      padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom,
                                      ),
                                      child: SizedBox(
                                        //to control bottom sheet height
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.50,
                                        child: Form(
                                          key:
                                              fetchOrdersController.editFormKey,
                                          child: ListView(
                                            padding: const EdgeInsets.all(30),
                                            children: [
                                              Center(
                                                  child: Text(
                                                // 'Edit Order $id',
                                                '${'edit_order'.tr}$id',
                                                style: TextStyle(
                                                  fontFamily: "Satoshi",
                                                  color: context
                                                      .theme.primaryColorDark,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight
                                                      .normal, // typing style
                                                ),
                                              )),

                                              addVerticalSpace(15),

                                              CustomOrderField(
                                                controller:
                                                    fetchOrdersController
                                                        .editNameController,
                                                // controller: orderController.objectNameController,
                                                hintText: 'type'.tr,
                                                labelText:
                                                    'what'.tr,
                                              ),
                                              CustomOrderField(
                                                controller:
                                                    fetchOrdersController
                                                        .editSourceController,
                                                hintText: 'type'.tr,
                                                labelText: 'pickup'.tr,
                                              ),
                                              CustomOrderField(
                                                controller: fetchOrdersController
                                                    .editDestinationController,
                                                hintText: 'type'.tr,
                                                labelText: 'drop'.tr,
                                              ),
                                              addVerticalSpace(15),
                                              //todo bottom sheet button
                                              Center(
                                                child: MaterialButton(
                                                  onPressed: () async {
                                                    await CacheHelper()
                                                        .saveData(
                                                            key: 'orderId',
                                                            value: id);
                                                    await fetchOrdersController
                                                        .editOrder();
                                                    Navigator.pop(context);
                                                  },
                                                  minWidth: 150,
                                                  height: 50,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  // color: Colors.orange[200],
                                                  color: context.theme
                                                      .colorScheme.onBackground,
                                                  child: Text(
                                                    // "Edit my Order",
                                                    "edit_order".tr,
                                                    style: TextStyle(
                                                      fontFamily: "Satoshi",
                                                      color: context
                                                          .theme
                                                          .colorScheme
                                                          .secondary,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight
                                                          .normal, // typing style
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // addVerticalSpace(20),
                                              // Text('bottomsheet ends here',
                                              //   style: TextStyle(
                                              //     fontFamily: "Satoshi",
                                              //     color: context.theme.primaryColor,
                                              //     fontSize: 15,
                                              //     fontWeight: FontWeight.normal, // typing style
                                              //   ),),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                            //two working lines instead of bottom sheet
                            // await CacheHelper().saveData(key: 'orderId', value: id) ;
                            // await fetchOrdersController.editOrder() ;
                          },
                          // color: Colors.blue,
                          padding: const EdgeInsets.all(5),
                          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          minWidth: 5,
                          height: 10,
                          child: Text(
                            "edit".tr,
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
                        //todo delete button
                        MaterialButton(
                          onPressed: () async {
                            AwesomeDialog(
                              context: context,

                              dialogType: DialogType.warning,
                              animType: AnimType.rightSlide,
                              dismissOnTouchOutside: false,
                              // title: 'del$id ?',
                              title: '${'delete_order'.tr}$id${'question_mark'.tr}',
                              titleTextStyle: TextStyle(
                                fontFamily: "Satoshi",
                                color: context.theme.colorScheme.onSecondary,
                                fontSize: 17,
                                fontWeight: FontWeight.normal, // typing style
                              ),
                              // desc: 'Dialog description here.............',
                              // barrierColor: Colors.white.withOpacity(0.7),
                              dialogBackgroundColor:
                                  context.theme.primaryColorLight,
                              dialogBorderRadius: BorderRadius.circular(30),
                              btnOkText: 'yes'.tr,
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
                                await fetchOrdersController.deleteOrder();
                              },
                            ).show();
                          },
                          padding: const EdgeInsets.all(5),
                          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          minWidth: 5,
                          height: 10,
                          child: Text(
                            "delete".tr,
                            style: const TextStyle(
                              fontFamily: "Satoshi",
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.w500, // typing style
                            ),

                            // style: TextStyle(
                            //     color: Colors.red,
                            //     fontSize: 15,
                            //     fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(
                      height: 10,
                    ),
              addVerticalSpace(5),
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
