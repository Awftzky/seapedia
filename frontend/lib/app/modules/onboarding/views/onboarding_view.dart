import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seapedia/app/core/widgets/button/custom_button.dart';
import '../../../core/theme/app_colors.dart';
import '../../../routes/app_pages.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery untuk responsivitas font dan ukuran elemen
    final size = MediaQuery.of(context).size;
    final sw = size.width;
    final sh = size.height;

    return Scaffold(
      backgroundColor: AppColors.textBlack, // Latar bawah hitam pekat sesuai referensi
      body: Column(
        children: [
          // --- BAGIAN ATAS: Visual Terang (Aksen Biru Muda) ---
          Expanded(
            flex: 55, // Mengambil 55% ruang layar
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.lightBlueAccent, // Warna biru muda
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: SafeArea(
                bottom: false, // SafeArea hanya berlaku untuk bagian atas (notch/status bar)
                child: Center(
                  // Ikon minimalis sebagai pengganti ilustrasi wajah di referensi
                  child: Icon(
                    Icons.storefront_outlined,
                    size: (sw * 0.35).clamp(100.0, 200.0),
                    color: AppColors.textBlack,
                  ),
                ),
              ),
            ),
          ),

          // --- BAGIAN BAWAH: Teks dan Navigasi ---
          Expanded(
            flex: 45, // Mengambil 45% ruang layar
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: sw * 0.08, vertical: sh * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Ready to explore?',
                    style: TextStyle(
                      fontSize: (sw * 0.08).clamp(28.0, 40.0),
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteBg, // Teks putih di atas background hitam
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: sh * 0.02),
                  Text(
                    'Connect as a Buyer, Seller, or Driver in one unified marketplace.',
                    style: TextStyle(
                      fontSize: (sw * 0.04).clamp(14.0, 18.0),
                      color: AppColors.textGray,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const Spacer(),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Get.offAllNamed(Routes.PUBLIC_CATALOG),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: AppColors.textGray,
                            fontSize: (sw * 0.04).clamp(14.0, 16.0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: sw * 0.4,
                        child: CustomButton(
                          text: 'Next >',
                          isPrimary: false,
                          onPressed: () => Get.offAllNamed(Routes.PUBLIC_CATALOG),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}