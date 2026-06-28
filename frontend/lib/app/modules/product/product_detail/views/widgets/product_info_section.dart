import 'package:flutter/material.dart';
import 'package:seapedia/app/core/theme/app_colors.dart';

class ProductInfoSection extends StatelessWidget {
  final Map<String, String> product;
  final double sw;

  const ProductInfoSection({super.key, required this.product, required this.sw});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product['price'] ?? '',
          style: TextStyle(
            fontSize: sw * 0.08,
            fontWeight: FontWeight.w900,
            color: AppColors.textBlack,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product['name'] ?? '',
          style: TextStyle(
            fontSize: sw * 0.05,
            fontWeight: FontWeight.w600,
            color: AppColors.textBlack,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.whiteBg,
            border: Border.all(color: AppColors.softGray, width: 2),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            'Stock: ${product['stock']}',
            style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textGray),
          ),
        ),
      ],
    );
  }
}