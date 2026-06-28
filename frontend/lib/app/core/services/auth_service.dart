import 'package:get/get.dart';

class AuthService extends GetxService {
  final RxBool isLoggedIn = false.obs;
  final RxList<String> userRoles = <String>[].obs;
  final RxString activeRole = ''.obs;

  Future<AuthService> init() async {
    return this;
  }

  void loginDummy() {
    isLoggedIn.value = true;
    userRoles.assignAll(['Buyer', 'Seller']);

    if (userRoles.length > 1) {
      Get.offAllNamed('/role-selection');
    } else {
      setActiveRole(userRoles.first);
    }
  }

  void setActiveRole(String role) {
    activeRole.value = role;

    if (role == 'Seller') {
      Get.offAllNamed('/seller-dashboard');
    } else if (role == 'Buyer') {
      Get.offAllNamed('/buyer-dashboard');
    } else if (role == 'Driver') {
      Get.offAllNamed('/driver-dashboard');
    } else if (role == 'Admin') {
      Get.offAllNamed('/admin-dashboard');
    }
  }

  void logout() {
    isLoggedIn.value = false;
    userRoles.clear();
    activeRole.value = '';
    Get.offAllNamed('/public-catalog');
  }
}