import 'package:flutter/material.dart';
import 'package:seapedia/app/core/theme/app_colors.dart';

class PromoBanner extends StatelessWidget {
  final double sw;
  const PromoBanner({super.key, required this.sw});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(sw * 0.06),
      decoration: BoxDecoration(
        color: AppColors.lightBlueAccent,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover\nNew Arrivals',
            style: TextStyle(
              color: AppColors.textBlack,
              fontSize: sw * 0.07,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Explore top products from trusted sellers.',
            style: TextStyle(color: AppColors.textBlack),
          ),
        ],
      ),
    );
  }
}