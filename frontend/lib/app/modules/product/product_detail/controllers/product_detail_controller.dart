import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  // Dummy data produk (Nanti akan didapat dari parameter rute atau API)
  final product = {
    'name': 'Minimalist Desk Setup',
    'price': 'Rp 2.500.000',
    'description': 'Tingkatkan produktivitas Anda dengan set meja kerja minimalis ini. Terbuat dari bahan kayu solid berkualitas tinggi dengan finishing matte yang elegan. Cocok untuk ruang kerja modern.',
    'storeName': 'TechHaven Official',
    'stock': '15',
  }.obs;
}