import 'package:get/get.dart';

import '../controllers/public_catalog_controller.dart';

class PublicCatalogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PublicCatalogController>(
      () => PublicCatalogController(),
    );
  }
}
