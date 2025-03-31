import 'package:flutter/material.dart';
import '../colors.dart';
import 'images.dart';

/// Sport-Specific Components
class SportSpecific {
  // Match Timer
  static Widget matchTimer({
    required String time,
    bool isLive = true,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: SportColors.textDark,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLive) ...[
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: SportColors.refereeRed,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 6),
          ],
          Text(
            time,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Score Board
  static Widget scoreBoard({
    required String homeTeam,
    required String awayTeam,
    required String homeScore,
    required String awayScore,
    String? homeImageUrl,
    String? awayImageUrl,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: SportColors.backgroundLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                if (homeImageUrl != null) ...[
                  SportImages.teamLogo(
                    imageUrl: homeImageUrl,
                    size: 48,
                  ),
                  const SizedBox(height: 8),
                ],
                Text(
                  homeTeam,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: SportColors.textDark,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              children: [
                Text(
                  homeScore,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: SportColors.textDark,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "-",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: SportColors.textDark,
                    ),
                  ),
                ),
                Text(
                  awayScore,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: SportColors.textDark,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                if (awayImageUrl != null) ...[
                  SportImages.teamLogo(
                    imageUrl: awayImageUrl,
                    size: 48,
                  ),
                  const SizedBox(height: 8),
                ],
                Text(
                  awayTeam,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: SportColors.textDark,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Stat Bar
  static Widget statBar({
    required String label,
    required double homeValue,
    required double awayValue,
    String? homeLabel,
    String? awayLabel,
  }) {
    final total = homeValue + awayValue;
    final homePercentage = total > 0 ? homeValue / total : 0.0;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: SportColors.textCaption,
            ),
          ),
        ),
        Row(
          children: [
            if (homeLabel != null) ...[
              Text(
                homeLabel,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: SportColors.textDark,
                ),
              ),
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Container(
                height: 12,
                decoration: BoxDecoration(
                  color: SportColors.backgroundLight,
                  borderRadius: BorderRadius.circular(6),
                ),
                clipBehavior: Clip.hardEdge,
                child: Row(
                  children: [
                    FractionallySizedBox(
                      widthFactor: homePercentage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: SportColors.sportBlue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            bottomLeft: Radius.circular(6),
                            topRight: homePercentage == 1.0 ? Radius.circular(6) : Radius.zero,
                            bottomRight: homePercentage == 1.0 ? Radius.circular(6) : Radius.zero,
                          ),
                        ),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 1 - homePercentage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: SportColors.energyOrange,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                            topLeft: homePercentage == 0.0 ? Radius.circular(6) : Radius.zero,
                            bottomLeft: homePercentage == 0.0 ? Radius.circular(6) : Radius.zero,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (awayLabel != null) ...[
              const SizedBox(width: 8),
              Text(
                awayLabel,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: SportColors.textDark,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
