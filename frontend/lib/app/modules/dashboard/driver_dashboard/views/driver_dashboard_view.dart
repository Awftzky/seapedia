import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/driver_dashboard_controller.dart';
import 'widgets/empty_orders_view.dart';
import 'widgets/order_card.dart';

class DriverDashboardView extends GetView<DriverDashboardController> {
  const DriverDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DriverDashboardController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Hello, Driver 👋',
          style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w800),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: const Color(0xFF1C1C1E),
              child: const Icon(Icons.notifications_none, color: Colors.white),
            ),
          )
        ],
      ),
      body: Obx(() {
        if (controller.activeOrders.isEmpty) return const EmptyOrdersView();

        return ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: controller.activeOrders.length,
          itemBuilder: (context, index) {
            final order = controller.activeOrders[index];
            return OrderCard(
              order: order,
              onActionPressed: () => controller.updateOrderStatus(order['id'], order['status']),
            );
          },
        );
      }),
    );
  }
}