import 'package:get/get.dart';
import '../../../../data/providers/wallet_provider.dart';

class WalletController extends GetxController {
  final WalletProvider _walletProvider = WalletProvider();

  final balance = 0.0.obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadBalance();
  }

  Future<void> loadBalance() async {
    isLoading.value = true;
    try {
      // Memanggil API via Provider
      final fetchedBalance = await _walletProvider.fetchBalance();
      balance.value = fetchedBalance;
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat saldo dompet');
    } finally {
      isLoading.value = false;
    }
  }

  // Fungsi ini akan dipanggil oleh CartController saat checkout
  Future<bool> pay(double amount) async {
    isLoading.value = true;
    final success = await _walletProvider.processPayment(amount);

    if (success) {
      // Update saldo di UI setelah pembayaran berhasil
      balance.value -= amount;
    }

    isLoading.value = false;
    return success;
  }
}