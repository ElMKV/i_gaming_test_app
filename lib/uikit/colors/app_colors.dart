import 'package:flutter/material.dart';

/// Design tokens for the app UI Kit.
abstract final class AppColors {
  // Brand
  static const Color primary = Color(0xFF1B6B4A);
  static const Color primaryLight = Color(0xFFD8EEE4);
  static const Color primaryDark = Color(0xFF0F3F2C);
  static const Color accent = Color(0xFFE8A838);
  static const Color accentSoft = Color(0x33E8A838);

  // Surfaces / panels
  static const Color background = Color(0xFFF4F7F5);
  static const Color panel = Color(0xFFFFFFFF);
  static const Color panelSelected = Color(0x401B6B4A);
  static const Color panelMuted = Color(0xFFF0F3F1);

  // Text
  static const Color textPrimary = Color(0xFF14201A);
  static const Color textSecondary = Color(0xFF5C6B63);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textAccent = Color(0xFF8A5A00);

  // Borders / icons
  static const Color border = Color(0xFFD5DDD8);
  static const Color borderFocused = primary;
  static const Color icon = Color(0xFF7A8A81);
  static const Color iconActive = primary;

  // Buttons
  static const Color buttonPrimary = primary;
  static const Color buttonPrimaryPressed = primaryDark;
  static const Color buttonPrimaryDisabled = Color(0xFFA8C4B6);
  static const Color buttonSecondary = panelMuted;
  static const Color buttonSecondaryText = textPrimary;

  // Status
  static const Color success = Color(0xFF2F9E6B);
  static const Color warning = accent;
  static const Color error = Color(0xFFD64545);

  // Gradients
  static const Color gradientStart = primary;
  static const Color gradientEnd = Color(0xFF3A8F6E);
}
