import 'package:flutter/material.dart';
import '../colors.dart';

/// Typography Components
class SportTypography {
  // Heading
  static Widget heading(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: SportColors.textDark,
        ),
      ),
    );
  }

  // Subheading
  static Widget subheading(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: SportColors.textMedium,
        ),
      ),
    );
  }

  // Body
  static Widget body(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: SportColors.textLight,
      ),
    );
  }

  // Caption
  static Widget caption(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: SportColors.textCaption,
      ),
    );
  }

  // Score Text
  static Widget scoreText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: SportColors.textDark,
      ),
    );
  }
}
