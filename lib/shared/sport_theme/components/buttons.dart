import 'package:flutter/material.dart';
import '../colors.dart';
import '../enums.dart';

/// Button Components
class SportButtons {
  // Primary Button
  static Widget primaryButton({
    required String text,
    required VoidCallback onPressed,
    ButtonVariant variant = ButtonVariant.primary,
    bool isDisabled = false,
  }) {
    Color backgroundColor;
    switch (variant) {
      case ButtonVariant.success:
        backgroundColor = SportColors.teamGreen;
        break;
      case ButtonVariant.danger:
        backgroundColor = SportColors.refereeRed;
        break;
      case ButtonVariant.warning:
        backgroundColor = SportColors.cautionYellow;
        break;
      default:
        backgroundColor = SportColors.sportBlue;
    }

    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(12),
        disabledOpacity: 0.6,
      ),
      child: Text(text),
    );
  }

  // Icon Button
  static Widget iconButton({
    required IconData icon,
    required VoidCallback onPressed,
    Color? color,
  }) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      color: color ?? SportColors.sportBlue,
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(
        minWidth: 48,
        minHeight: 48,
      ),
      style: IconButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  // Floating Action Button
  static Widget floatingActionButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: SportColors.energyOrange,
      elevation: 6,
      child: Icon(icon, color: Colors.white),
    );
  }
}
