import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color bgColor;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.bgColor,
  });

  static const Color cardBlack = Color(0xFF1C1C1E);
  static const Color accentCyan = Color(0xFF9DE4F4);

  @override
  Widget build(BuildContext context) {
    final bool isAccent = bgColor == accentCyan;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isAccent ? accentCyan : cardBlack,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isAccent ? Colors.black54 : Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: isAccent ? Colors.black : Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}