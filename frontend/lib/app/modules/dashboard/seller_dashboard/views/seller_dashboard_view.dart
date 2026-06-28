import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/button/custom_button.dart';
import '../controllers/seller_dashboard_controller.dart';
import 'store_setup_view.dart';

class SellerDashboardView extends GetView<SellerDashboardController> {
  const SellerDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    bool hasStore = false;

    return Scaffold(
      backgroundColor: AppColors.whiteBg,
      body: hasStore
          ? _buildDashboardContent()
          : _buildEmptyState(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.storefront_outlined, size: 80, color: AppColors.textGray),
            const SizedBox(height: 24),
            const Text('Belum ada toko', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            CustomButton(
              text: 'Buat Toko Sekarang',
              onPressed: () => Get.to(() => const StoreSetupView()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardContent() {
    return const Center(child: Text("Dashboard Produk Penjual"));
  }
}