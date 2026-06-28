import 'package:flutter/material.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Keranjangmu masih kosong',
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }
}