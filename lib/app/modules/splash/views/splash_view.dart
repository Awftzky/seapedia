import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.textBlack,
      body: Center(
        child: Text(
          'SEAPEDIA',
          style: TextStyle(
            fontSize: (screenWidth * 0.1).clamp(32.0, 80.0),
            fontWeight: FontWeight.w900,
            color: AppColors.lightBlueAccent,
            letterSpacing: 2.0,
          ),
        ),
      ),
    );
  }
}