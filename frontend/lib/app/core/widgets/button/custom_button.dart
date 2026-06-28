import 'package:flutter/material.dart';
import 'package:seapedia/app/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final bool useBlueAccent;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.useBlueAccent = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bgColor = useBlueAccent
        ? AppColors.lightBlueAccent
        : (isPrimary ? AppColors.textBlack : AppColors.whiteBg);

    Color textColor = useBlueAccent
        ? AppColors.textBlack
        : (isPrimary ? AppColors.textWhite : AppColors.textBlack);

    return SizedBox(
      width: double.infinity, // Akan selebar kontainer parent yang membungkusnya
      height: 56, // Tinggi 56 logical pixels sudah sangat proporsional di mobile maupun web
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            // Angka 100 memastikan lengkungannya selalu berbentuk pill penuh, berapapun tinggi tombolnya
            borderRadius: BorderRadius.circular(100),
            side: isPrimary
                ? BorderSide.none
                : const BorderSide(color: AppColors.softGray, width: 2),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16, // Ukuran font absolut lebih aman untuk komponen atomik
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}