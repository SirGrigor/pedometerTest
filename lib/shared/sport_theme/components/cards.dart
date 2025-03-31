import 'package:flutter/material.dart';
import '../colors.dart';

/// Card Components
class SportCards {
  // Score Card
  static Widget scoreCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: SportColors.backgroundWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }

  // Player Card
  static Widget playerCard({
    required String name,
    required String position,
    String? imageUrl,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: SportColors.backgroundWhite,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          if (imageUrl != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                imageUrl,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: SportColors.textDark,
                  ),
                ),
                Text(
                  position,
                  style: const TextStyle(
                    fontSize: 14,
                    color: SportColors.textCaption,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Stats Card
  static Widget statsCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: SportColors.backgroundLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
