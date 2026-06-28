import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seapedia/app/core/theme/app_colors.dart';
import '../controllers/product_detail_controller.dart';

// Import local widgets
import 'widgets/product_image_header.dart';
import 'widgets/product_info_section.dart';
import 'widgets/store_info_section.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailController());
    final size = MediaQuery.of(context).size;
    final sw = size.width;
    final sh = size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteBg,
      extendBodyBehindAppBar: true, // Agar gambar produk bisa merembes ke bawah App Bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AppColors.whiteBg,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.textBlack, size: 18),
              onPressed: () => Get.back(),
            ),
          ),
        ),
      ),
      body: Obx(() {
        final product = controller.product;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageHeader(sh: sh),
              Padding(
                padding: EdgeInsets.all(sw * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductInfoSection(product: product, sw: sw),
                    SizedBox(height: sw * 0.08),

                    const Text(
                      'Description',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textBlack),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product['description'] ?? '',
                      style: const TextStyle(fontSize: 15, color: AppColors.textGray, height: 1.5),
                    ),

                    SizedBox(height: sw * 0.08),
                    StoreInfoSection(storeName: product['storeName'] ?? ''),
                    SizedBox(height: sw * 0.1),

                    // Catatan: Tidak ada tombol Add to Cart di sini karena statusnya masih Guest (Level 1 Rules)
                    Center(
                      child: Text(
                        'Please login to purchase this item.',
                        style: TextStyle(color: AppColors.textGray.withValues(alpha: 0.8), fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}