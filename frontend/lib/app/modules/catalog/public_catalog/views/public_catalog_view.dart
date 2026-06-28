import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seapedia/app/core/theme/app_colors.dart';
import 'package:seapedia/app/core/widgets/button/custom_button.dart';
import 'package:seapedia/app/modules/catalog/public_catalog/views/widgets/app_review_list.dart';
import 'package:seapedia/app/routes/app_pages.dart';

import '../controllers/public_catalog_controller.dart';

// Import local widgets
import 'widgets/promo_banner.dart';
import 'widgets/product_grid.dart';
import 'widgets/review_bottom_sheet.dart';

class PublicCatalogView extends GetView<PublicCatalogController> {
  const PublicCatalogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PublicCatalogController());
    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.whiteBg,
      appBar: _buildAppBar(sw),
      body: ListView(
        padding: EdgeInsets.all(sw * 0.06),
        children: [
          PromoBanner(sw: sw),
          SizedBox(height: sw * 0.08),

          _buildSectionHeader('Trending Now', sw),
          SizedBox(height: sw * 0.04),
          ProductGrid(sw: sw),

          SizedBox(height: sw * 0.1),

          _buildSectionHeader('App Reviews', sw),
          SizedBox(height: sw * 0.04),
          const AppReviewList(),

          SizedBox(height: sw * 0.06),

          CustomButton(
            text: 'Write an App Review',
            isPrimary: false,
            onPressed: () => Get.bottomSheet(
              ReviewBottomSheet(sw: sw),
              isScrollControlled: true,
            ),
          ),
          SizedBox(height: sw * 0.06),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, double sw) {
    return Text(
      title,
      style: TextStyle(
        fontSize: sw * 0.05,
        fontWeight: FontWeight.bold,
        color: AppColors.textBlack,
      ),
    );
  }

  AppBar _buildAppBar(double sw) {
    return AppBar(
      backgroundColor: AppColors.whiteBg,
      elevation: 0,
      title: Text(
        'SEAPEDIA',
        style: TextStyle(
          color: AppColors.textBlack,
          fontWeight: FontWeight.w900,
          fontSize: sw * 0.06,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sw * 0.04, vertical: 8.0),
          child: TextButton(
            onPressed: () => Get.toNamed(Routes.LOGIN),
            style: TextButton.styleFrom(
              backgroundColor: AppColors.textBlack,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            child: const Text('Login', style: TextStyle(color: AppColors.whiteBg, fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}