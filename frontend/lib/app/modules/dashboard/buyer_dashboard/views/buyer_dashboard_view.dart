import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/button/custom_button.dart';
import '../controllers/buyer_dashboard_controller.dart';

class BuyerDashboardView extends GetView<BuyerDashboardController> {
  const BuyerDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BuyerDashboardController());

    return Scaffold(
      backgroundColor: AppColors.whiteBg,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBg,
        elevation: 0,
        title: const Text('Buyer Dashboard', style: TextStyle(color: AppColors.textBlack, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_bag, size: 80, color: AppColors.lightBlueAccent),
            const SizedBox(height: 24),
            const Text(
              'Welcome to Buyer Area',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textBlack),
            ),
            const SizedBox(height: 12),
            const Text(
              'Di sini nanti akan ada fitur Wallet, Cart, Checkout, dan History Transaksi (Level 3).',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textGray),
            ),
            const SizedBox(height: 48),
            CustomButton(
              text: 'Logout',
              isPrimary: false,
              onPressed: controller.logout,
            ),
          ],
        ),
      ),
    );
  }
}