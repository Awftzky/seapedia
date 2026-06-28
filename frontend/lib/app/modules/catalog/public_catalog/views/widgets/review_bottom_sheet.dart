import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seapedia/app/core/theme/app_colors.dart';
import 'package:seapedia/app/core/widgets/button/custom_button.dart';
import 'package:seapedia/app/core/widgets/input/custom_text_field.dart';

import '../../controllers/public_catalog_controller.dart';

class ReviewBottomSheet extends GetView<PublicCatalogController> {
  final double sw;
  const ReviewBottomSheet({Key? key, required this.sw}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(sw * 0.06),
      decoration: const BoxDecoration(
        color: AppColors.whiteBg,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      child: Wrap(
        children: [
          Text('Leave a Review', style: TextStyle(fontSize: sw * 0.05, fontWeight: FontWeight.bold, color: AppColors.textBlack)),
          SizedBox(height: sw * 0.08, width: double.infinity),
          CustomTextField(
            hint: 'Your Name',
            controller: controller.reviewerNameController,
          ),
          const SizedBox(height: 16, width: double.infinity),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Rating', style: TextStyle(fontWeight: FontWeight.bold)),
              Obx(() => Row(
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < controller.selectedRating.value ? Icons.star : Icons.star_border,
                      color: Colors.orange,
                    ),
                    onPressed: () => controller.setRating(index + 1),
                  );
                }),
              )),
            ],
          ),
          const SizedBox(height: 16, width: double.infinity),
          CustomTextField(
            hint: 'What do you think about our app?',
            controller: controller.reviewCommentController,
          ),
          SizedBox(height: sw * 0.08, width: double.infinity),
          CustomButton(
            text: 'Submit Review',
            useBlueAccent: true,
            onPressed: controller.submitReview,
          ),
        ],
      ),
    );
  }
}