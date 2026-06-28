import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Perhatikan path routes ini menyesuaikan strukturmu
import '../../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // State untuk melacak role yang dipilih user
  final isBuyer = true.obs;
  final isSeller = false.obs;
  final isDriver = false.obs;

  final isLoading = false.obs;

  void toggleRole(String role) {
    if (role == 'Buyer') isBuyer.toggle();
    if (role == 'Seller') isSeller.toggle();
    if (role == 'Driver') isDriver.toggle();
  }

  void register() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Semua field wajib diisi!', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (!isBuyer.value && !isSeller.value && !isDriver.value) {
      Get.snackbar('Error', 'Pilih setidaknya satu peran untuk akun Anda!', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;

    nameController.clear();
    emailController.clear();
    passwordController.clear();

    Get.snackbar(
      'Pendaftaran Berhasil!',
      'Akun Anda berhasil dibuat. Silakan Login.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    // Asumsi nama rute-mu LOGIN di app_pages.dart
    Get.offNamed(Routes.LOGIN);
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}