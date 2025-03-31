import 'package:flutter/material.dart';
import '../colors.dart';
import '../enums.dart';

/// Badge Components
class SportBadges {
  // Notification Badge
  static Widget notificationBadge({
    required Widget child,
    required String count,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          top: -8,
          right: -8,
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 24,
              minHeight: 24,
            ),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: SportColors.refereeRed,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                count,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Status Badge
  static Widget statusBadge({
    required String text,
    BadgeStatus status = BadgeStatus.success,
  }) {
    Color backgroundColor;
    switch (status) {
      case BadgeStatus.warning:
        backgroundColor = SportColors.cautionYellow;
        break;
      case BadgeStatus.error:
        backgroundColor = SportColors.refereeRed;
        break;
      case BadgeStatus.info:
        backgroundColor = SportColors.sportBlue;
        break;
      default:
        backgroundColor = SportColors.teamGreen;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
