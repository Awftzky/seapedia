import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class RoleChip extends StatelessWidget {
  final String role;
  final bool isSelected;
  final VoidCallback onTap;
  final double sw;

  const RoleChip({
    Key? key,
    required this.role,
    required this.isSelected,
    required this.onTap,
    required this.sw,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: sw * 0.05, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.textBlack : AppColors.softGray,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected) ...[
              const Icon(Icons.check_circle, color: AppColors.whiteBg, size: 18),
              const SizedBox(width: 8),
            ],
            Text(
              role,
              style: TextStyle(
                color: isSelected ? AppColors.whiteBg : AppColors.textGray,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}