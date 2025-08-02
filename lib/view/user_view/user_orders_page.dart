import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/user_controller/fetch_orders_controller.dart';

import '../../api/dio_consumer.dart';
import '../../custom_widgets/custom_expansiontile.dart';
import '../../functions/add_space.dart';

class UserOrdersPage extends StatefulWidget {
  const UserOrdersPage({super.key});

  @override
  State<UserOrdersPage> createState() => _UserOrdersPageState();
}

class _UserOrdersPageState extends State<UserOrdersPage>
    with SingleTickerProviderStateMixin {
  late FetchOrdersController fetchOrdersController;

  TabController? tabController;

  @override
  void initState() {
    fetchOrdersController =
        Get.put(FetchOrdersController(DioConsumer(dio: Dio())));

    ///to refresh on start
    // fetchOrdersController.refreshKey1.currentState?.show();
    // fetchOrdersController.refreshTab1();
    /// Show the RefreshIndicator after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchOrdersController.refreshKey1.currentState?.show();
    });

    tabController = TabController(length: 3, vsync: this);

    ///to listen to change in tabs
    tabController!.addListener(() async {
      if (!tabController!.indexIsChanging && tabController!.index == 0) {
        // await Future.delayed(Duration(milliseconds: 100)); // wait for tab to fully build
        // await fetchOrdersController.refreshTab1();
        ///call only once
        fetchOrdersController.refreshKey1.currentState?.show();
      } else if (!tabController!.indexIsChanging && tabController!.index == 1) {
        fetchOrdersController.refreshKey2.currentState?.show();
      } else if (!tabController!.indexIsChanging && tabController!.index == 2) {
        fetchOrdersController.refreshKey3.currentState?.show();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    tabController?.dispose();
    fetchOrdersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
        // backgroundColor: context.theme.primaryColorLight,
        backgroundColor: context.theme.primaryColor,
        bottom: TabBar(
          controller: tabController,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.deepOrangeAccent,
          // labelColor: context.theme.colorScheme.secondary,
          labelColor: Colors.black,
          unselectedLabelColor: context.theme.colorScheme.background,
          labelStyle: const TextStyle(
            fontFamily: "Satoshi",
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: "Satoshi",
            // color: Colors.grey.shade700,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          tabs: [
            Tab(text: 'pending'.tr),
            Tab(
              text: 'in_progress'.tr,
            ),
            Tab(
              text: 'completed'.tr,
            ),
          ],
        ),

        ///todo icon button in tab bar
        // IconButton(
        //     onPressed: () {
        //       showPopover(context: context,
        //           bodyBuilder: (context) => Column(),
        //         direction: PopoverDirection.bottom,
        //         width: 250,height: 150,
        //       );
        // },
        // icon: Icon(Icons.more_vert)),

        ///for appbar height
        toolbarHeight: 10,
      ),

      ///todo floating
      // floatingActionButton: FloatingActionButton(
      //   onPressed: null,
      //   // Disable default onPressed because PopupMenuButton handles taps
      //   tooltip: 'filter',
      //   backgroundColor: context.theme.primaryColor,
      //   child: PopupMenuButton<String>(
      //     icon: Icon(
      //       Icons.filter_alt,
      //       color: context.theme.colorScheme.secondary,
      //     ),
      //     // Your FAB icon
      //     onSelected: (value) {
      //       /// handle selection here
      //       // print('Selected: $value');
      //     },
      //     itemBuilder: (context) => [
      //       PopupMenuItem(
      //         enabled: false,
      //         value: 'all',
      //         //     child: Text('all',
      //         // style: TextStyle(
      //         //   fontFamily: "Satoshi",),),
      //         child: Container(
      //           decoration: BoxDecoration(
      //             color: Colors.black.withOpacity(0.7),
      //             borderRadius: BorderRadius.circular(12),
      //           ),
      //         ),
      //       ),
      //       PopupMenuItem(value: 'pending', child: Text('pending')),
      //       PopupMenuItem(value: 'completed', child: Text('completed')),
      //     ],
      //     // color: Colors.white.withOpacity(0.0),
      //     color: Colors.transparent,
      //   ),
      // ),

      body: TabBarView(
        controller: tabController,
        children: [
          ///todo pending orders -first tab-
          GetBuilder<FetchOrdersController>(
            // init: fetchOrdersController,
            builder: (controller) {
              if (controller.pendingOrdersList.isEmpty) {
                //todo center text if there are no orders
                return RefreshIndicator(
                  key: fetchOrdersController.refreshKey1,
                  onRefresh: controller.refreshTab1,
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
                        // 'No orders yet...',
                        'no_orders'.tr,
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
                  key: fetchOrdersController.refreshKey1,
                  onRefresh: controller.refreshTab1,
                  // onRefresh: () async {
                  //   await controller.fetchPendingOrders();
                  // },
                  color: context.theme.primaryColor,
                  backgroundColor: context.theme.primaryColorLight,
                  child: ListView.builder(
                    //to scroll always chat
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: controller.pendingOrdersList.length,
                    itemBuilder: (context, i) {
                      return CustomExpansionTile(
                        leading: controller.pendingOrdersList[i].id,
                        title: controller.pendingOrdersList[i].orderName,
                        trailing: controller.pendingOrdersList[i].status,
                        id: controller.pendingOrdersList[i].id,
                        name: controller.pendingOrdersList[i].orderName,
                        source: controller.pendingOrdersList[i].source,
                        destination:
                            controller.pendingOrdersList[i].destination,
                        status: controller.pendingOrdersList[i].status,
                        created: controller.pendingOrdersList[i].createdAt,
                        buttons: true,
                      );
                    },
                  ),
                );
              }
            },
          ),

          ///todo in progress orders -second tab-
          GetBuilder<FetchOrdersController>(
            // init: fetchOrdersController,
            builder: (controller) {
              if (controller.inProgressOrdersList.isEmpty) {
                //todo center text if there are no orders
                return RefreshIndicator(
                  key: fetchOrdersController.refreshKey2,
                  onRefresh: controller.refreshTab2,
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
                        // 'No orders yet...',
                        'no_orders'.tr,
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
                  key: fetchOrdersController.refreshKey2,
                  onRefresh: () async {
                    await controller.fetchInProgressOrders();
                  },
                  color: context.theme.primaryColor,
                  backgroundColor: context.theme.primaryColorLight,
                  child: ListView.builder(
                    //to scroll always chat
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: controller.inProgressOrdersList.length,
                    itemBuilder: (context, i) {
                      return CustomExpansionTile(
                          leading: controller.inProgressOrdersList[i].id,
                          title: controller.inProgressOrdersList[i].orderName,
                          trailing: controller.inProgressOrdersList[i].status,
                          id: controller.inProgressOrdersList[i].id,
                          name: controller.inProgressOrdersList[i].orderName,
                          source: controller.inProgressOrdersList[i].source,
                          destination:
                              controller.inProgressOrdersList[i].destination,
                          status: controller.inProgressOrdersList[i].status,
                          created: controller.inProgressOrdersList[i].createdAt,
                          updated: controller.inProgressOrdersList[i].updatedAt,
                          deliveryManId:
                              controller.inProgressOrdersList[i].driver.id,
                          deliveryManName:
                              controller.inProgressOrdersList[i].driver.name,
                          deliveryManPhone:
                              controller.inProgressOrdersList[i].driver.phone,
                          buttons: false);
                    },
                  ),
                );
              }
            },
          ),

          ///todo completed orders -second tab-
          GetBuilder<FetchOrdersController>(
            // init: fetchOrdersController,
            builder: (controller) {
              if (controller.completedOrdersList.isEmpty) {
                //todo center text if there are no orders
                return RefreshIndicator(
                  key: fetchOrdersController.refreshKey3,
                  onRefresh: controller.refreshTab3,
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
                          // 'No completed orders yet...\n    Scroll down to refresh',
                          'no_orders'.tr,
                          style: TextStyle(
                            color: context.theme.primaryColorDark,
                            fontSize: 17,
                            fontWeight: FontWeight.normal, // typing style
                          ),
                        ),
                      ),
                      addVerticalSpace(100),
                    ],
                  ),
                );
              } else {
                return RefreshIndicator(
                  key: fetchOrdersController.refreshKey3,
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
                      return CustomExpansionTile(
                          leading: controller.completedOrdersList[i].id,
                          title: controller.completedOrdersList[i].orderName,
                          trailing: controller.completedOrdersList[i].status,
                          id: controller.completedOrdersList[i].id,
                          name: controller.completedOrdersList[i].orderName,
                          source: controller.completedOrdersList[i].source,
                          destination:
                              controller.completedOrdersList[i].destination,
                          status: controller.completedOrdersList[i].status,
                          created: controller.completedOrdersList[i].createdAt,
                          updated: controller.completedOrdersList[i].updatedAt,
                          deliveryManId:
                              controller.completedOrdersList[i].driver.id,
                          deliveryManName:
                              controller.completedOrdersList[i].driver.name,
                          deliveryManPhone:
                              controller.completedOrdersList[i].driver.phone,
                          buttons: false);
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
