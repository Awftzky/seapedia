import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seapedia/app/core/theme/app_colors.dart';
import 'package:seapedia/app/routes/app_pages.dart';

class ProductCard extends StatelessWidget {
  final Map<String, String> product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.PRODUCT_DETAIL),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.softGray,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteBg,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Icon(Icons.inventory_2_outlined, color: AppColors.textGray, size: 40),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              product['name'] ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textBlack),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              product['price'] ?? '',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.textGray),
            ),
          ],
        ),
      ),
    );
  }
}