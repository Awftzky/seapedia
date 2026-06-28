import 'package:flutter/material.dart';
import 'package:seapedia/app/core/theme/app_colors.dart';

class StoreInfoSection extends StatelessWidget {
  final String storeName;
  const StoreInfoSection({super.key, required this.storeName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightBlueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: AppColors.whiteBg,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.storefront, color: AppColors.textBlack),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sold by',
                  style: TextStyle(fontSize: 12, color: AppColors.textBlack),
                ),
                Text(
                  storeName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textBlack,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}