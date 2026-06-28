import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/button/custom_button.dart';
import '../../../../core/widgets/input/custom_text_field.dart';
import '../controllers/register_controller.dart';
import 'widgets/role_chip.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {

    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.whiteBg,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.textBlack),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: sw * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Account 🚀',
                style: TextStyle(
                  fontSize: sw * 0.08,
                  color: AppColors.textBlack,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              SizedBox(height: sw * 0.02),
              const Text(
                'Join SEAPEDIA and explore the ecosystem.',
                style: TextStyle(color: AppColors.textGray),
              ),
              SizedBox(height: sw * 0.08),

              CustomTextField(
                hint: 'Full Name',
                controller: controller.nameController,
              ),
              CustomTextField(
                hint: 'Email Address',
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
                hint: 'Password',
                controller: controller.passwordController,
                isPassword: true,
              ),

              SizedBox(height: sw * 0.04),
              Text(
                'Choose Your Roles',
                style: TextStyle(
                  fontSize: sw * 0.045,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textBlack,
                ),
              ),
              SizedBox(height: sw * 0.02),
              const Text(
                'You can select more than one role for your account.',
                style: TextStyle(fontSize: 13, color: AppColors.textGray),
              ),
              SizedBox(height: sw * 0.04),

              Obx(() => Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  RoleChip(
                    role: 'Buyer',
                    isSelected: controller.isBuyer.value,
                    onTap: () => controller.toggleRole('Buyer'),
                    sw: sw,
                  ),
                  RoleChip(
                    role: 'Seller',
                    isSelected: controller.isSeller.value,
                    onTap: () => controller.toggleRole('Seller'),
                    sw: sw,
                  ),
                  RoleChip(
                    role: 'Driver',
                    isSelected: controller.isDriver.value,
                    onTap: () => controller.toggleRole('Driver'),
                    sw: sw,
                  ),
                ],
              )),

              SizedBox(height: sw * 0.1),

              Obx(() => CustomButton(
                text: controller.isLoading.value ? 'Loading...' : 'Register',
                useBlueAccent: true,
                onPressed: controller.isLoading.value ? () {} : controller.register,
              )),

              SizedBox(height: sw * 0.06),
            ],
          ),
        ),
      ),
    );
  }
}