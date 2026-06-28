import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seapedia/app/core/theme/app_colors.dart';
import '../../controllers/public_catalog_controller.dart';

class AppReviewList extends GetView<PublicCatalogController> {
  const AppReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.appReviews.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final review = controller.appReviews[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.softGray,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(review['name'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const Spacer(),
                  const Icon(Icons.star, color: Colors.orange, size: 16),
                  const SizedBox(width: 4),
                  Text(review['rating'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              Text(review['comment'] ?? '', style: const TextStyle(color: AppColors.textGray, fontSize: 13)),
            ],
          ),
        );
      },
    ));
  }
}