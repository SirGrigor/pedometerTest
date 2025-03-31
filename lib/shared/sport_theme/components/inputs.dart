import 'package:flutter/material.dart';
import '../colors.dart';

/// Input Components
class SportInputs {
  // Text Field
  static Widget textField({
    required TextEditingController controller,
    String? labelText,
    String? hintText,
    bool isError = false,
    String? errorText,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        errorText: isError ? errorText : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: SportColors.borderMedium,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: SportColors.borderMedium,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: SportColors.sportBlue,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: SportColors.refereeRed,
            width: 1,
          ),
        ),
        filled: true,
        fillColor: SportColors.backgroundWhite,
        contentPadding: const EdgeInsets.all(12),
      ),
    );
  }

  // Search Bar
  static Widget searchBar({
    required TextEditingController controller,
    required Function(String) onChanged,
    String hintText = "Search...",
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: SportColors.backgroundLight,
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.search),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
        ),
      ),
    );
  }
}
