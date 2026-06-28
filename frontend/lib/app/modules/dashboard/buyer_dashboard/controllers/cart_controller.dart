import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'wallet_controller.dart'; // Pastikan import WalletController

class CartController extends GetxController {
  // Observables
  final cartItems = <Map<String, dynamic>>[].obs;
  final currentStoreId = RxnInt();

  // Getter untuk total harga
  double get totalPrice => cartItems.fold(
      0, (sum, item) => sum + (item['price'] * item['quantity']));

  // Fungsi tambah ke keranjang dengan validasi Single-Store
  void addToCart(Map<String, dynamic> product) {
    if (currentStoreId.value != null && currentStoreId.value != product['storeId']) {
      Get.snackbar(
        'Toko Berbeda!',
        'Kamu hanya bisa checkout dari 1 toko yang sama. Kosongkan keranjang dulu ya.',
        backgroundColor: const Color(0xFF1A1A1A),
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 24,
      );
      return;
    }

    // Set storeId jika keranjang tadinya kosong
    if (cartItems.isEmpty) {
      currentStoreId.value = product['storeId'];
    }

    // Cek apakah item sudah ada di keranjang
    int index = cartItems.indexWhere((item) => item['id'] == product['id']);
    if (index != -1) {
      cartItems[index]['quantity'] += 1;
      cartItems.refresh();
    } else {
      cartItems.add({...product, 'quantity': 1});
    }
  }

  void removeItem(int productId) {
    cartItems.removeWhere((item) => item['id'] == productId);
    if (cartItems.isEmpty) {
      currentStoreId.value = null; // Reset toko jika keranjang kosong
    }
  }

  void clearCart() {
    cartItems.clear();
    currentStoreId.value = null;
  }

  void checkout() async {
    if (cartItems.isEmpty) return;

    // 1. Ambil instance WalletController
    // Gunakan Get.put jika belum diinisialisasi di binding
    final walletCtrl = Get.put(WalletController());

    // 2. Tampilkan indikator loading (opsional)
    Get.dialog(
      const Center(child: CircularProgressIndicator(color: Color(0xFF9DE4F4))),
      barrierDismissible: false,
    );

    // 3. Panggil fungsi bayar yang sudah API-Ready
    bool isPaymentSuccess = await walletCtrl.pay(totalPrice);

    Get.back(); // Tutup dialog loading

    // 4. Validasi hasil pembayaran
    if (isPaymentSuccess) {
      Get.snackbar(
        'Checkout Berhasil 🎉',
        'Pembayaran sukses! Saldo terpotong.',
        backgroundColor: const Color(0xFF9DE4F4),
        colorText: Colors.black,
        margin: const EdgeInsets.all(16),
        borderRadius: 24,
      );
      clearCart();

      // TODO: Nanti tambahkan logika memindahkan data cart ke tab "History"
    } else {
      Get.snackbar(
        'Pembayaran Gagal',
        'Saldo tidak mencukupi untuk total Rp ${totalPrice.toStringAsFixed(0)}',
        backgroundColor: const Color(0xFF1A1A1A),
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 24,
      );
    }
  }
}