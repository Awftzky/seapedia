import 'package:flutter/material.dart';
import 'package:seapedia/app/core/theme/app_colors.dart';

class ProductImageHeader extends StatelessWidget {
  final double sh;
  const ProductImageHeader({super.key, required this.sh});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: sh * 0.4, // Mengambil 40% tinggi layar
      decoration: const BoxDecoration(
        color: AppColors.softGray,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.inventory_2_outlined,
          size: 100,
          color: AppColors.textGray,
        ),
      ),
    );
  }
}