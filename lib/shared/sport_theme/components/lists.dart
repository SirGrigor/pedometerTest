import 'package:flutter/material.dart';
import '../colors.dart';

/// List Components
class SportLists {
  // List Item
  static Widget listItem({
    required String title,
    String? subtitle,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: SportColors.borderLight,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            if (leading != null) ...[
              leading,
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: SportColors.textDark,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: SportColors.textCaption,
                      ),
                    ),
                ],
              ),
            ),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );
  }

  // Leaderboard Item
  static Widget leaderboardItem({
    required int rank,
    required String name,
    required String score,
    String? imageUrl,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: SportColors.borderLight,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            alignment: Alignment.center,
            child: Text(
              rank.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: rank <= 3 ? SportColors.sportBlue : SportColors.textDark,
              ),
            ),
          ),
          const SizedBox(width: 12),
          if (imageUrl != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageUrl,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                color: SportColors.textDark,
              ),
            ),
          ),
          Text(
            score,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: SportColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}
