import 'package:flutter/material.dart';
import 'package:seapedia/app/core/widgets/button/custom_button.dart';
import 'package:seapedia/app/core/widgets/input/custom_text_field.dart';
import '../../controllers/product_management_controller.dart';

class ProductForm extends StatelessWidget {
  final ProductManagementController controller;
  const ProductForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(hint: 'Nama Produk', controller: controller.nameController),
        CustomTextField(hint: 'Harga', controller: controller.priceController, keyboardType: TextInputType.number),
        CustomTextField(hint: 'Stok', controller: controller.stockController, keyboardType: TextInputType.number),
        const SizedBox(height: 20),
        CustomButton(text: 'Simpan Produk', useBlueAccent: true, onPressed: controller.addProduct),
      ],
    );
  }
}