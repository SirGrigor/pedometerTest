import 'package:flutter/material.dart';

/// Sports-themed shared UI components for mobile application
class SportComponents {
  // Color constants
  static const Color sportBlue = Color(0xFF1E88E5);
  static const Color teamGreen = Color(0xFF43A047);
  static const Color refereeRed = Color(0xFFE53935);
  static const Color cautionYellow = Color(0xFFFFB300);
  static const Color energyOrange = Color(0xFFFF6D00);
  static const Color textDark = Color(0xFF212121);
  static const Color textMedium = Color(0xFF424242);
  static const Color textLight = Color(0xFF616161);
  static const Color textCaption = Color(0xFF757575);
  static const Color borderLight = Color(0xFFEEEEEE);
  static const Color borderMedium = Color(0xFFBDBDBD);
  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color backgroundWhite = Color(0xFFFFFFFF);

  /// Button Components
  static class Buttons {
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
          backgroundColor = teamGreen;
          break;
        case ButtonVariant.danger:
          backgroundColor = refereeRed;
          break;
        case ButtonVariant.warning:
          backgroundColor = cautionYellow;
          break;
        default:
          backgroundColor = sportBlue;
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
        color: color ?? sportBlue,
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
        backgroundColor: energyOrange,
        elevation: 6,
        child: Icon(icon, color: Colors.white),
      );
    }
  }

  /// Card Components
  abstract class Cards {
    // Score Card
    static Widget scoreCard({required Widget child}) {
      return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundWhite,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: child,
      );
    }

    // Player Card
    static Widget playerCard({
      required String name,
      required String position,
      String? imageUrl,
    }) {
      return Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: backgroundWhite,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            if (imageUrl != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  imageUrl,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textDark,
                    ),
                  ),
                  Text(
                    position,
                    style: const TextStyle(
                      fontSize: 14,
                      color: textCaption,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Stats Card
    static Widget statsCard({required Widget child}) {
      return Container(
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      );
    }
  }

  /// Typography Components
  abstract class Typography {
    // Heading
    static Widget heading(String text) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: textDark,
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
            color: textMedium,
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
          color: textLight,
        ),
      );
    }

    // Caption
    static Widget caption(String text) {
      return Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: textCaption,
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
          color: textDark,
        ),
      );
    }
  }

  /// Input Components
  abstract class Inputs {
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
              color: borderMedium,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: borderMedium,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: sportBlue,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: refereeRed,
              width: 1,
            ),
          ),
          filled: true,
          fillColor: backgroundWhite,
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
          color: backgroundLight,
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

  /// List Components
  abstract class Lists {
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
                color: borderLight,
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
                        color: textDark,
                      ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: textCaption,
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
              color: borderLight,
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
                  color: rank <= 3 ? sportBlue : textDark,
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
                  color: textDark,
                ),
              ),
            ),
            Text(
              score,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textDark,
              ),
            ),
          ],
        ),
      );
    }
  }

  /// Navigation Components
  abstract class Navigation {
    // Tab Bar
    static Widget tabBar({
      required List<TabItem> items,
      required int selectedIndex,
      required Function(int) onTap,
    }) {
      return Container(
        height: 56,
        decoration: BoxDecoration(
          color: backgroundWhite,
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
                      color: selectedIndex == index ? sportBlue : textCaption,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      items[index].label,
                      style: TextStyle(
                        fontSize: 12,
                        color: selectedIndex == index ? sportBlue : textCaption,
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

  /// Progress Indicators
  abstract class Progress {
    // Progress Bar
    static Widget progressBar({
      required double value, // 0.0 to 1.0
      Color? progressColor,
    }) {
      return Container(
        height: 8,
        decoration: BoxDecoration(
          color: backgroundLight,
          borderRadius: BorderRadius.circular(4),
        ),
        child: FractionallySizedBox(
          widthFactor: value.clamp(0.0, 1.0),
          child: Container(
            decoration: BoxDecoration(
              color: progressColor ?? sportBlue,
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
          color: sportBlue,
          strokeWidth: large ? 4.0 : 2.5,
        ),
      );
    }
  }

  /// Image Components
  abstract class Images {
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
              color: backgroundLight,
              child: Icon(
                Icons.person,
                size: size * 0.6,
                color: textCaption,
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
            color: backgroundLight,
            child: Icon(
              Icons.sports,
              size: size * 0.6,
              color: textCaption,
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
              color: backgroundLight,
              child: Icon(
                Icons.image,
                size: height * 0.3,
                color: textCaption,
              ),
            );
          },
        ),
      );
    }
  }

  /// Badge Components
  abstract class Badges {
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
                color: refereeRed,
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
          backgroundColor = cautionYellow;
          break;
        case BadgeStatus.error:
          backgroundColor = refereeRed;
          break;
        case BadgeStatus.info:
          backgroundColor = sportBlue;
          break;
        default:
          backgroundColor = teamGreen;
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

  /// Layout Components
  abstract class Layout {
    // Divider
    static Widget divider() {
      return Container(
        height: 1,
        margin: const EdgeInsets.symmetric(vertical: 8),
        color: borderLight,
      );
    }

    // Spacer
    static Widget spacer({double height = 16}) {
      return SizedBox(height: height);
    }
  }

  /// Sport-Specific Components
  abstract class SportSpecific {
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
          color: textDark,
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
                  color: refereeRed,
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
          color: backgroundLight,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  if (homeImageUrl != null) ...[
                    Images.teamLogo(
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
                      color: textDark,
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
                      color: textDark,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "-",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: textDark,
                      ),
                    ),
                  ),
                  Text(
                    awayScore,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: textDark,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  if (awayImageUrl != null) ...[
                    Images.teamLogo(
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
                      color: textDark,
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
                color: textCaption,
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
                    color: textDark,
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Container(
                  height: 12,
                  decoration: BoxDecoration(
                    color: backgroundLight,
                    borderRadius: BorderRadius.circular(6),
                    overflow: Clip.hardEdge,
                  ),
                  child: Row(
                    children: [
                      FractionallySizedBox(
                        widthFactor: homePercentage,
                        child: Container(
                          decoration: BoxDecoration(
                            color: sportBlue,
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
                            color: energyOrange,
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
                    color: textDark,
                  ),
                ),
              ],
            ],
          ),
        ],
      );
    }
  }
}

/// Enums for component variants
enum ButtonVariant {
  primary,
  success,
  danger,
  warning,
}

enum BadgeStatus {
  success,
  warning,
  error,
  info,
}

/// Tab item for navigation
class TabItem {
  final IconData icon;
  final String label;

  TabItem({
    required this.icon,
    required this.label,
  });
}
