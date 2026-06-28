import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DriverDashboardController extends GetxController {
  // Dummy data pesanan yang masuk dari Level 3
  // Nanti ini diisi dari GET /api/orders?status=pending
  final activeOrders = <Map<String, dynamic>>[
    {
      'id': 'ORD-001',
      'storeName': 'Toko Sejahtera',
      'buyerName': 'Budi Santoso',
      'destination': 'Gedung TULT, Telkom University',
      'status': 'Menunggu Driver', // Menunggu Driver, Menuju Toko, Sedang Diantar, Selesai
      'totalPrice': 45000,
    },
    {
      'id': 'ORD-002',
      'storeName': 'Kantin Asrama',
      'buyerName': 'Andi',
      'destination': 'Asrama Putra Gedung A',
      'status': 'Sedang Diantar',
      'totalPrice': 20000,
    }
  ].obs;

  // Fungsi untuk mengubah status pesanan
  void updateOrderStatus(String orderId, String currentStatus) {
    int index = activeOrders.indexWhere((order) => order['id'] == orderId);
    if (index == -1) return;

    String nextStatus = '';
    Color notifColor = const Color(0xFF9DE4F4); // Aksen Cyan

    switch (currentStatus) {
      case 'Menunggu Driver':
        nextStatus = 'Menuju Toko';
        break;
      case 'Menuju Toko':
        nextStatus = 'Sedang Diantar';
        break;
      case 'Sedang Diantar':
        nextStatus = 'Selesai';
        notifColor = Colors.greenAccent; // Ganti warna untuk status Selesai
        break;
      default:
        return;
    }

    // Update status di UI
    activeOrders[index]['status'] = nextStatus;
    activeOrders.refresh();

    // Notifikasi sukses
    Get.snackbar(
      'Status Diperbarui',
      'Pesanan $orderId sekarang: $nextStatus',
      backgroundColor: notifColor,
      colorText: Colors.black,
      margin: const EdgeInsets.all(16),
      borderRadius: 24,
    );

    // Jika selesai, hapus dari daftar aktif (pindah ke history)
    if (nextStatus == 'Selesai') {
      Future.delayed(const Duration(seconds: 2), () {
        activeOrders.removeAt(index);
      });
    }

    // TODO: Nanti panggil PUT /api/orders/:id/status di sini
  }
}