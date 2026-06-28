import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seapedia/app/core/network/api_client.dart';
import 'package:seapedia/app/routes/app_pages.dart';
import 'package:seapedia/app/core/services/auth_service.dart';
import 'package:seapedia/app/core/theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(ApiClient());

  await GetStorage.init();

  await Get.putAsync(() => AuthService().init());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "SEAPEDIA",
      debugShowCheckedModeBanner: false,

      initialRoute: AppPages.INITIAL,

      getPages: AppPages.routes,

      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.whiteBg,
        primaryColor: AppColors.textBlack,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.whiteBg,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.textBlack),
          titleTextStyle: TextStyle(
            color: AppColors.textBlack,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}