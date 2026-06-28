import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seapedia/app/modules/dashboard/seller_dashboard/controllers/store_setup_coontroller.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/button/custom_button.dart';
import '../../../../core/widgets/input/custom_text_field.dart';

class StoreSetupView extends GetView<StoreSetupController> {
  const StoreSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StoreSetupController());
    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.whiteBg,
      appBar: AppBar(title: const Text('Setup Store')),
      body: Padding(
        padding: EdgeInsets.all(sw * 0.06),
        child: Column(
          children: [
            CustomTextField(
              hint: 'Nama Toko Unik',
              controller: controller.storeNameController,
            ),
            SizedBox(height: 24),
            Obx(() => CustomButton(
              text: controller.isLoading.value ? 'Saving...' : 'Create Store',
              useBlueAccent: true,
              onPressed: controller.saveStore,
            )),
          ],
        ),
      ),
    );
  }
}