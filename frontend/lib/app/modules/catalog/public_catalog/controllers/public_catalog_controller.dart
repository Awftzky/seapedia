import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublicCatalogController extends GetxController {
  // --- Dummy Data untuk Produk ---
  final products = [
    {'name': 'Minimalist Desk setup', 'price': 'Rp 2.500.000'},
    {'name': 'Mechanical Keyboard', 'price': 'Rp 1.200.000'},
    {'name': 'Wireless Mouse', 'price': 'Rp 850.000'},
    {'name': 'Noise Cancelling Headphones', 'price': 'Rp 3.100.000'},
  ].obs;

  // --- Dummy Data & Logika untuk Ulasan Aplikasi ---
  final appReviews = [
    {'name': 'John Doe', 'rating': '5', 'comment': 'UI-nya sangat bersih dan responsif!'},
    {'name': 'Jane Smith', 'rating': '4', 'comment': 'Sangat mudah digunakan untuk belanja.'},
  ].obs;

  // Controller untuk form ulasan
  final reviewerNameController = TextEditingController();
  final reviewCommentController = TextEditingController();
  final selectedRating = 5.obs; // Default rating 5

  void setRating(int rating) {
    selectedRating.value = rating;
  }

  void submitReview() {
    if (reviewerNameController.text.isEmpty || reviewCommentController.text.isEmpty) {
      Get.snackbar('Oops!', 'Nama dan ulasan tidak boleh kosong.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Tambahkan ke state (Nanti ini diganti dengan request POST ke .NET API)
    appReviews.insert(0, {
      'name': reviewerNameController.text,
      'rating': selectedRating.value.toString(),
      'comment': reviewCommentController.text,
    });

    // Bersihkan form dan tutup modal
    reviewerNameController.clear();
    reviewCommentController.clear();
    selectedRating.value = 5;
    Get.back(); // Tutup BottomSheet

    Get.snackbar('Sukses', 'Terima kasih atas ulasan aplikasi Anda!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white);
  }

  @override
  void onClose() {
    reviewerNameController.dispose();
    reviewCommentController.dispose();
    super.onClose();
  }
}