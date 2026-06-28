import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AdminDashboardController extends GetxController {
  // Statistik Dummy
  final totalRevenue = 15500000.obs;
  final activeUsers = 124.obs;

  // Daftar toko yang butuh verifikasi
  final pendingStores = <Map<String, dynamic>>[
    {
      'id': 'STR-001',
      'name': 'Seafood Segar Mang Ucup',
      'owner': 'Ucup Surucup',
      'status': 'Pending'
    },
    {
      'id': 'STR-002',
      'name': 'Grosir Ikan Asin',
      'owner': 'Bu Tejo',
      'status': 'Pending'
    }
  ].obs;

  void verifyStore(String storeId, bool isApproved) {
    int index = pendingStores.indexWhere((store) => store['id'] == storeId);
    if (index == -1) return;

    String action = isApproved ? 'Disetujui' : 'Ditolak';
    Color notifColor = isApproved ? const Color(0xFF9DE4F4) : Colors.redAccent;

    // Hapus dari daftar pending
    pendingStores.removeAt(index);

    Get.snackbar(
      'Verifikasi Toko',
      'Toko $storeId berhasil $action',
      backgroundColor: notifColor,
      colorText: isApproved ? Colors.black : Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 24,
    );

    // TODO: Nanti panggil PUT /api/admin/verify-store/:id di sini
  }
}