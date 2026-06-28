import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import '../services/auth_service.dart';

class ApiClient extends GetConnect {
  @override
  void onInit() {
    // 1. Setup Base URL (Ganti sesuai URL Backend-mu nanti)
    httpClient.baseUrl = 'http://localhost:3000/api';
    httpClient.timeout = const Duration(seconds: 30);

    // 2. Request Interceptor: Otomatis tambahkan token ke header
    httpClient.addRequestModifier<dynamic>((request) {
      final authService = AuthService.to;

      // Jika user sudah login, tambahkan token ke header
      // Asumsi: Kita nanti akan menyimpan token di AuthService
      // request.headers['Authorization'] = 'Bearer ${authService.token.value}';

      return request;
    });

    // 3. Response Interceptor: Cek error global (misal: Token Expired)
    httpClient.addResponseModifier((request, response) {
      if (response.statusCode == 401) {
        // Otomatis logout jika token tidak valid
        AuthService.to.logout();
      }
      return response;
    });
  }
}