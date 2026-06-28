import 'package:flutter/material.dart';
import 'package:seapedia/app/core/theme/app_colors.dart';


class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        style: const TextStyle(
          color: AppColors.textBlack,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.textGray),
          filled: true,
          fillColor: AppColors.softGray, // Background abu-abu lembut
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          // Tanpa border saat idle
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          // Border hitam tebal saat user sedang mengetik
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.textBlack, width: 2),
          ),
        ),
      ),
    );
  }
}