import 'package:flutter/material.dart';
import '../colors.dart';

/// Progress Indicators
class SportProgress {
  // Progress Bar
  static Widget progressBar({
    required double value, // 0.0 to 1.0
    Color? progressColor,
  }) {
    return Container(
      height: 8,
      decoration: BoxDecoration(
        color: SportColors.backgroundLight,
        borderRadius: BorderRadius.circular(4),
      ),
      child: FractionallySizedBox(
        widthFactor: value.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: progressColor ?? SportColors.sportBlue,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  // Activity Indicator
  static Widget activityIndicator({bool large = true}) {
    return Center(
      child: CircularProgressIndicator(
        color: SportColors.sportBlue,
        strokeWidth: large ? 4.0 : 2.5,
      ),
    );
  }
}
