import 'package:flutter/material.dart';

class EmptyPendingView extends StatelessWidget {
  const EmptyPendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        'Semua toko sudah terverifikasi! 🎉',
        style: TextStyle(color: Colors.grey, fontSize: 16),
      ),
    );
  }
}