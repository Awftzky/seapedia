import 'package:flutter/material.dart';

class CartCheckoutBar extends StatelessWidget {
  final double totalPrice;
  final VoidCallback onCheckout;

  const CartCheckoutBar({
    super.key,
    required this.totalPrice,
    required this.onCheckout,
  });

  static const Color cardBlack = Color(0xFF1C1C1E);
  static const Color accentCyan = Color(0xFF9DE4F4);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      decoration: const BoxDecoration(
        color: cardBlack,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total Price',
                style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                'Rp ${totalPrice.toStringAsFixed(0)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: onCheckout,
            style: ElevatedButton.styleFrom(
              backgroundColor: accentCyan,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              elevation: 0,
            ),
            child: const Text(
              'Checkout >',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}