import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductManagementController extends GetxController {
  // Dummy data produk penjual
  final myProducts = <Map<String, dynamic>>[
    {'id': 1, 'name': 'Meja Minimalis', 'price': '2500000', 'stock': 10},
  ].obs;

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final stockController = TextEditingController();

  void addProduct() {
    if (nameController.text.isEmpty || priceController.text.isEmpty) return;

    myProducts.add({
      'id': DateTime.now().millisecondsSinceEpoch,
      'name': nameController.text,
      'price': priceController.text,
      'stock': int.parse(stockController.text),
    });

    nameController.clear();
    priceController.clear();
    stockController.clear();
    Get.back(); // Tutup form
  }

  void deleteProduct(int id) {
    myProducts.removeWhere((item) => item['id'] == id);
  }
}