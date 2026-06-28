import 'package:flutter/material.dart';

class OrderStatusBadge extends StatelessWidget {
  final String status;
  final bool isWaiting;

  const OrderStatusBadge({
    super.key,
    required this.status,
    required this.isWaiting,
  });

  static const Color accentCyan = Color(0xFF9DE4F4);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isWaiting ? Colors.white.withValues(alpha: 0.1) : accentCyan,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: isWaiting ? Colors.white : Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}