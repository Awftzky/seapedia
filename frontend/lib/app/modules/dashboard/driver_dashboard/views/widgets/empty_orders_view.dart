import 'package:flutter/material.dart';

class EmptyOrdersView extends StatelessWidget {
  const EmptyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Belum ada pesanan masuk.\nSantai dulu aja! ☕',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }
}