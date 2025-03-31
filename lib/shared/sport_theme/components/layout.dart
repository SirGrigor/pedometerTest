import 'package:flutter/material.dart';
import '../colors.dart';

/// Layout Components
class SportLayout {
  // Divider
  static Widget divider() {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: SportColors.borderLight,
    );
  }

  // Spacer
  static Widget spacer({double height = 16}) {
    return SizedBox(height: height);
  }
}
