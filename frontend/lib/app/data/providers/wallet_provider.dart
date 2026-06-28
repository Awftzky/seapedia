import 'package:get/get.dart';

class WalletProvider extends GetConnect {
  // Simulasi nilai di database
  double _mockBalance = 500000.0;

  // Simulasi GET request ke /api/wallet/balance
  Future<double> fetchBalance() async {
    await Future.delayed(const Duration(seconds: 1)); // Mocking network delay
    // Nanti ganti dengan:
    // final response = await get('http://localhost:3000/api/wallet/balance');
    // return response.body['balance'];
    return _mockBalance;
  }

  // Simulasi POST request ke /api/wallet/pay
  Future<bool> processPayment(double amount) async {
    await Future.delayed(const Duration(seconds: 1));
    // Nanti ganti dengan pemanggilan POST API sungguhan
    if (_mockBalance >= amount) {
      _mockBalance -= amount;
      return true;
    }
    return false; // Saldo tidak cukup
  }
}