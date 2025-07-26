import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/api/dio_consumer.dart';
import 'package:project2/controller/auth/sign_status.dart';
import 'package:project2/controller/delivery_man_controller/available_orders_controller.dart';
import 'package:project2/custom_widgets/delivery_exp_tile.dart';

import '../../cache/cache_helper.dart';
import '../../functions/add_space.dart';

class DeliveryManPage extends StatefulWidget {
  const DeliveryManPage({super.key});

  @override
  State<DeliveryManPage> createState() => _DeliveryManPageState();
}

class _DeliveryManPageState extends State<DeliveryManPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  late AvailableOrdersController availableOrdersController;

  // AvailableOrdersController availableOrdersController
  // = Get.put(AvailableOrdersController());
  late SignStatus signStatus;

  @override
  void initState() {

    ///put it here to init controller first
    availableOrdersController =
      Get.put(AvailableOrdersController(DioConsumer(dio: Dio())));
  signStatus = Get.put(SignStatus());

  tabController = TabController(length: 3, vsync: this);

    ///to refresh on start
    // availableOrdersController.refreshTabKey1.currentState?.show();
    // availableOrdersController.refreshAvailableOrders();
    /// Show the RefreshIndicator after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      availableOrdersController.refreshTabKey1.currentState?.show();
    });
    ///to listen to change in tabs
    tabController!.addListener(() async {
      if (!tabController!.indexIsChanging && tabController!.index == 0) {
        ///call only once
        availableOrdersController.refreshTabKey1.currentState?.show();
        // availableOrdersController.refreshAvailableOrders();
      } else if (!tabController!.indexIsChanging && tabController!.index == 1) {
        availableOrdersController.refreshTabKey2.currentState?.show();
        // availableOrdersController.refreshPickedOrders();
      }else if (!tabController!.indexIsChanging && tabController!.index == 2) {
        availableOrdersController.refreshTabKey3.currentState?.show();
      }
    });


    super.initState();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: tabController,
            //todo another indicator theme
            //   indicator: BoxDecoration(
            //     borderRadius: BorderRadius.circular(50),
            //     color: Colors.orange.withOpacity(0.3),
            //   ),
            indicatorColor: Colors.deepOrange,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
            labelStyle: const TextStyle(
              fontFamily: "Satoshi",
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: "Satoshi",
              color: Colors.grey.shade700,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            tabs: const [
              Tab(text: "available\n  orders"),
              Tab(text: "in progress\n    orders"),
              Tab(text: "completed\n    orders"),
            ],
          ),
          //for appbar height
          toolbarHeight: 5,
        ),
        body: SafeArea(
            child: TabBarView(
          controller: tabController,
          children: [
            ///todo available orders page -first tab-
            GetBuilder<AvailableOrdersController>(
              // init: fetchOrdersController,
              builder: (controller) {
                if (controller.pendingOrdersList.isEmpty) {
                  //todo center text if there are no orders
                  return RefreshIndicator(
                    key: availableOrdersController.refreshTabKey1,
                    onRefresh: controller.refreshAvailableOrders,
                    // color: Colors.orangeAccent,
                    color: context.theme.primaryColor,
                    // backgroundColor: Colors.white,
                    backgroundColor: context.theme.primaryColorLight,
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      // 👈 important!
                      children: [
                        addVerticalSpace(300),
                        // 👈 fake height to enable scroll
                        Center(
                            child: Text(
                          'No available orders yet...',
                          style: TextStyle(
                            color: context.theme.primaryColorDark,
                            fontSize: 17,
                            fontWeight: FontWeight.normal, // typing style
                          ),
                        )),
                      ],
                    ),
                  );
                } else {
                  return RefreshIndicator(
                    key: availableOrdersController.refreshTabKey1,
                    onRefresh: () async {
                      await controller.fetchPendingOrders();
                    },
                    color: context.theme.primaryColor,
                    backgroundColor: context.theme.primaryColorLight,
                    child: ListView.builder(
                      //to scroll always chat
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: controller.pendingOrdersList.length,
                      itemBuilder: (context, i) {
                        return DeliveryExpTile(
                            leading: controller.pendingOrdersList[i].orderName,
                            title: controller.pendingOrdersList[i].source,
                            trailing:
                                controller.pendingOrdersList[i].destination,
                            id: controller.pendingOrdersList[i].id,
                            orderName:
                                controller.pendingOrdersList[i].orderName,
                            source: controller.pendingOrdersList[i].source,
                            destination:
                                controller.pendingOrdersList[i].destination,
                            status: controller.pendingOrdersList[i].status,
                            created: controller.pendingOrdersList[i].createdAt,
                            // userId: controller.pendingOrdersList[i].user.id,
                            // userName: controller.pendingOrdersList[i].user.name,
                            // userPhone: controller.pendingOrdersList[i].user.phone,
                        pendingButton: true,);
                      },
                    ),
                  );
                }
              },
            ),

            ///todo in progress order page -second tab-
            GetBuilder<AvailableOrdersController>(
              // init: fetchOrdersController,
              builder: (controller) {
                if (controller.pickedOrdersList.isEmpty) {
                  //todo center text if there are no orders
                  return RefreshIndicator(
                    key: availableOrdersController.refreshTabKey2,
                    onRefresh: controller.refreshPickedOrders,
                    // color: Colors.orangeAccent,
                    color: context.theme.primaryColor,
                    // backgroundColor: Colors.white,
                    backgroundColor: context.theme.primaryColorLight,
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      // 👈 important!
                      children: [
                        addVerticalSpace(300),
                        // 👈 fake height to enable scroll
                        Center(
                            child: Text(
                              'No picked orders yet...',
                              style: TextStyle(
                                color: context.theme.primaryColorDark,
                                fontSize: 17,
                                fontWeight: FontWeight.normal, // typing style
                              ),
                            )),
                      ],
                    ),
                  );
                } else {
                  return RefreshIndicator(
                    key: availableOrdersController.refreshTabKey2,
                    onRefresh: () async {
                      await controller.fetchPickedOrders();
                    },
                    color: context.theme.primaryColor,
                    backgroundColor: context.theme.primaryColorLight,
                    child: ListView.builder(
                      //to scroll always chat
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: controller.pickedOrdersList.length,
                      itemBuilder: (context, i) {
                        return DeliveryExpTile(
                          leading: controller.pickedOrdersList[i].orderName,
                          title: controller.pickedOrdersList[i].source,
                          trailing:
                          controller.pickedOrdersList[i].destination,
                          id: controller.pickedOrdersList[i].id,
                          orderName:
                          controller.pickedOrdersList[i].orderName,
                          source: controller.pickedOrdersList[i].source,
                          destination:
                          controller.pickedOrdersList[i].destination,
                          status: controller.pickedOrdersList[i].status,
                          created: controller.pickedOrdersList[i].createdAt,
                          updated: controller.pickedOrdersList[i].updatedAt,
                          userId: controller.pickedOrdersList[i].user.id,
                          userName: controller.pickedOrdersList[i].user.name,
                          userPhone:
                          controller.pickedOrdersList[i].user.phone,
                          progressButton: true,);
                      },
                    ),
                  );
                }
              },
            ),

            ///todo completed order page -third tab-
            GetBuilder<AvailableOrdersController>(
              // init: fetchOrdersController,
              builder: (controller) {
                if (controller.completedOrdersList.isEmpty) {
                  //todo center text if there are no orders
                  return RefreshIndicator(
                    key: availableOrdersController.refreshTabKey3,
                    onRefresh: controller.refreshCompletedOrders,
                    // color: Colors.orangeAccent,
                    color: context.theme.primaryColor,
                    // backgroundColor: Colors.white,
                    backgroundColor: context.theme.primaryColorLight,
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      // 👈 important!
                      children: [
                        addVerticalSpace(300),
                        // 👈 fake height to enable scroll
                        Center(
                            child: Text(
                              'No available orders yet...',
                              style: TextStyle(
                                color: context.theme.primaryColorDark,
                                fontSize: 17,
                                fontWeight: FontWeight.normal, // typing style
                              ),
                            )),
                      ],
                    ),
                  );
                } else {
                  return RefreshIndicator(
                    key: availableOrdersController.refreshTabKey3,
                    onRefresh: () async {
                      await controller.fetchCompletedOrders();
                    },
                    color: context.theme.primaryColor,
                    backgroundColor: context.theme.primaryColorLight,
                    child: ListView.builder(
                      //to scroll always chat
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: controller.completedOrdersList.length,
                      itemBuilder: (context, i) {
                        return DeliveryExpTile(
                          leading: controller.completedOrdersList[i].orderName,
                          title: controller.completedOrdersList[i].source,
                          trailing:
                          controller.completedOrdersList[i].destination,
                          id: controller.completedOrdersList[i].id,
                          orderName:
                          controller.completedOrdersList[i].orderName,
                          source: controller.completedOrdersList[i].source,
                          destination:
                          controller.completedOrdersList[i].destination,
                          status: controller.completedOrdersList[i].status,
                          created: controller.completedOrdersList[i].createdAt,
                          updated: controller.completedOrdersList[i].updatedAt,
                          userId: controller.completedOrdersList[i].user.id,
                          userName: controller.completedOrdersList[i].user.name,
                          userPhone:
                          controller.completedOrdersList[i].user.phone,
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        )));
  }
}
