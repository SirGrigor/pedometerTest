import 'package:flutter/material.dart';
import '../colors.dart';

/// Image Components
class SportImages {
  // Avatar
  static Widget avatar({
    required String imageUrl,
    double size = 48,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2),
      child: Image.network(
        imageUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: size,
            height: size,
            color: SportColors.backgroundLight,
            child: Icon(
              Icons.person,
              size: size * 0.6,
              color: SportColors.textCaption,
            ),
          );
        },
      ),
    );
  }

  // Team Logo
  static Widget teamLogo({
    required String imageUrl,
    double size = 64,
  }) {
    return Image.network(
      imageUrl,
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: size,
          height: size,
          color: SportColors.backgroundLight,
          child: Icon(
            Icons.sports,
            size: size * 0.6,
            color: SportColors.textCaption,
          ),
        );
      },
    );
  }

  // Banner
  static Widget banner({
    required String imageUrl,
    double height = 180,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl,
        width: double.infinity,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: double.infinity,
            height: height,
            color: SportColors.backgroundLight,
            child: Icon(
              Icons.image,
              size: height * 0.3,
              color: SportColors.textCaption,
            ),
          );
        },
      ),
    );
  }
}
