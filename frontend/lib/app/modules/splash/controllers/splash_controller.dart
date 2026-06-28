import 'package:get/get.dart';
// Sesuaikan path import routes kamu
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(Routes.ONBOARDING);
  }
}