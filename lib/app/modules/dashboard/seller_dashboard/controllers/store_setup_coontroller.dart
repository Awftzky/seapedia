import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreSetupController extends GetxController {
  final storeNameController = TextEditingController();
  final isLoading = false.obs;

  void saveStore() async {
    if (storeNameController.text.isEmpty) {
      Get.snackbar('Error', 'Nama toko tidak boleh kosong.');
      return;
    }

    isLoading.value = true;
    // Simulasi API: Di sini nanti kamu akan POST nama toko ke backend
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;

    Get.snackbar('Berhasil', 'Toko "${storeNameController.text}" berhasil dibuat!');
    Get.back(); // Kembali ke dashboard
  }

  @override
  void onClose() {
    storeNameController.dispose();
    super.onClose();
  }
}