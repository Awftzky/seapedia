import 'package:get/get.dart';
import '../../../../core/services/auth_service.dart';

class SellerDashboardController extends GetxController {
  final authService = Get.find<AuthService>();

  void logout() {
    authService.logout();
  }
}