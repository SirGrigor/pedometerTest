import 'package:flutter/material.dart';
import '../colors.dart';
import '../models/tab_item.dart';

/// Navigation Components
class SportNavigation {
  // Tab Bar
  static Widget tabBar({
    required List<TabItem> items,
    required int selectedIndex,
    required Function(int) onTap,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: SportColors.backgroundWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
          (index) => InkWell(
            onTap: () => onTap(index),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    items[index].icon,
                    color: selectedIndex == index ? SportColors.sportBlue : SportColors.textCaption,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    items[index].label,
                    style: TextStyle(
                      fontSize: 12,
                      color: selectedIndex == index ? SportColors.sportBlue : SportColors.textCaption,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
