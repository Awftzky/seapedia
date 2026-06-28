import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seapedia/app/routes/app_pages.dart';

class AuthService extends GetxService {

  final box = GetStorage();

  static AuthService get to => Get.find<AuthService>();

  final RxBool isLoggedIn = false.obs;
  final RxList<String> userRoles = <String>[].obs;
  final RxString activeRole = ''.obs;

  Future<AuthService> init() async {
    // READ LOGIN STATUS
    isLoggedIn.value = box.read('isLoggedIn') ?? false;
    activeRole.value = box.read('activeRole') ?? '';
    return this;
  }

  void loginDummy() {
    isLoggedIn.value = true;
    box.write('isLoggedIn', true); 

    userRoles.assignAll(['Buyer', 'Seller']);

    if (userRoles.length > 1) {
      Get.offAllNamed(Routes.ROLE_SELECTION);
    } else {
      setActiveRole(userRoles.first);
    }
  }

  void setActiveRole(String role) {
    activeRole.value = role;
    box.write('activeRole', role);

    if (role == 'Seller') {
      Get.offAllNamed(Routes.DASHBOARD_SELLER);
    } else if (role == 'Buyer') {
      Get.offAllNamed(Routes.DASHBOARD_BUYER);
    } else if (role == 'Driver') {
      Get.offAllNamed(Routes.DASHBOARD_DRIVER);
    } else if (role == 'Admin') {
      Get.offAllNamed(Routes.DASHBOARD_ADMIN);
    }
  }

  void logout() {
    isLoggedIn.value = false;
    userRoles.clear();
    activeRole.value = '';

    box.remove('isLoggedIn');
    box.remove('activeRole');

    Get.offAllNamed(Routes.PUBLIC_CATALOG);

  }
}