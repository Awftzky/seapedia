import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/public_catalog_controller.dart';
import 'product_card.dart';

class ProductGrid extends GetView<PublicCatalogController> {
  final double sw;
  const ProductGrid({super.key, required this.sw});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: sw * 0.04,
        mainAxisSpacing: sw * 0.04,
        childAspectRatio: 0.75,
      ),
      itemCount: controller.products.length,
      itemBuilder: (context, index) {
        final product = controller.products[index];
        return ProductCard(product: product);
      },
    ));
  }
}