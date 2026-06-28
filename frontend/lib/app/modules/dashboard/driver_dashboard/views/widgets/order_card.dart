import 'package:flutter/material.dart';
import 'order_status_badge.dart';

class OrderCard extends StatelessWidget {
  final Map<String, dynamic> order;
  final VoidCallback onActionPressed;

  const OrderCard({
    super.key,
    required this.order,
    required this.onActionPressed,
  });

  static const Color cardBlack = Color(0xFF1C1C1E);
  static const Color accentCyan = Color(0xFF9DE4F4);
  static const Color textSecondary = Colors.grey;

  @override
  Widget build(BuildContext context) {
    final bool isWaiting = order['status'] == 'Menunggu Driver';

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardBlack,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OrderStatusBadge(status: order['status'], isWaiting: isWaiting),
              Text(
                order['id'],
                style: const TextStyle(color: textSecondary, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '📍 ${order['storeName']}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '🚩 ${order['destination']}',
            style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: Colors.white24, height: 1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pemesan',
                    style: TextStyle(color: textSecondary, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    order['buyerName'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: onActionPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isWaiting ? accentCyan : Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isWaiting ? 'Ambil Order' : 'Update',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward_ios, size: 14),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}