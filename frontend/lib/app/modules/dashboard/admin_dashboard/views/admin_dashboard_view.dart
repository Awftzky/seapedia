import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/admin_dashboard_controller.dart';
import 'widgets/stat_card.dart';
import 'widgets/empty_pending_view.dart';
import 'widgets/pending_store_card.dart';

class AdminDashboardView extends GetView<AdminDashboardController> {
  const AdminDashboardView({Key? key}) : super(key: key);

  static const Color accentCyan = Color(0xFF9DE4F4);

  @override
  Widget build(BuildContext context) {
    Get.put(AdminDashboardController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Admin Control 🎛️',
          style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w800),
        ),
      ),
      body: Obx(() => ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              Expanded(
                child: StatCard(
                  title: 'Total Revenue',
                  value: 'Rp ${(controller.totalRevenue.value / 1000000).toStringAsFixed(1)}M',
                  bgColor: accentCyan,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: StatCard(
                  title: 'Active Users',
                  value: '${controller.activeUsers.value}',
                  bgColor: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            'Pending Approvals',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          if (controller.pendingStores.isEmpty)
            const EmptyPendingView()
          else
            ...controller.pendingStores.map((store) => PendingStoreCard(
              store: store,
              onReject: () => controller.verifyStore(store['id'], false),
              onApprove: () => controller.verifyStore(store['id'], true),
            )),
        ],
      )),
    );
  }
}