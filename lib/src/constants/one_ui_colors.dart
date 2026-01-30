import 'package:flutter/material.dart';

/// Samsung One UI Color System
///
/// Based on official One UI design guidelines:
/// - Rich, solid colors for modern look
/// - Brightness and saturation within specific ranges
/// - Samsung's signature blue as primary color
/// - Consistent functional colors across light/dark modes
class OneUIColors {
  OneUIColors._();

  // === PRIMARY COLORS ===

  /// Samsung's signature blue - trust, hope, and stability
  /// Main color applied to all major UI components
  static const Color primaryBlue = Color(0xFF0078D4);
  static const Color primaryBlueDark = Color(0xFF0A84FF);

  /// Primary color variants for different contexts
  static const Color primaryLight = Color(0xFF4DA3FF);
  static const Color primaryDark = Color(0xFF0057A3);

  // === FUNCTIONAL COLORS ===

  /// Success/Positive actions (consistent in light/dark mode)
  static const Color success = Color(0xFF00C853);
  static const Color successDark = Color(0xFF69F0AE);

  /// Error/Destructive actions (unified red shade)
  static const Color error = Color(0xFFD32F2F);
  static const Color errorDark = Color(0xFFEF5350);

  /// Warning/Caution
  static const Color warning = Color(0xFFFFA726);
  static const Color warningDark = Color(0xFFFFB74D);

  /// Information
  static const Color info = Color(0xFF29B6F6);
  static const Color infoDark = Color(0xFF4FC3F7);

  // === BACKGROUND COLORS ===

  /// Light mode backgrounds - calm, visually comforting
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color surfaceLight = Color(0xFFF5F5F5);
  static const Color cardLight = Color(0xFFFFFFFF);

  /// Dark mode backgrounds
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color cardDark = Color(0xFF2C2C2C);

  // === TEXT COLORS ===

  /// Light mode text
  static const Color textPrimaryLight = Color(0xFF000000);
  static const Color textSecondaryLight = Color(0xFF666666);
  static const Color textDisabledLight = Color(0xFF9E9E9E);

  /// Dark mode text
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFB3B3B3);
  static const Color textDisabledDark = Color(0xFF757575);

  // === FOCUS BLOCK COLORS ===

  /// Type 1: Most frequently used (functional and practical)
  static const Color focusBlock1Light = Color(0xFFF5F5F5);
  static const Color focusBlock1Dark = Color(0xFF2C2C2C);

  /// Type 2: Subtle emphasis
  static const Color focusBlock2Light = Color(0xFFEEEEEE);
  static const Color focusBlock2Dark = Color(0xFF383838);

  /// Type 3: Gradient type (use with caution)
  static const LinearGradient focusBlockGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF5F5F5), Color(0xFFE0E0E0)],
  );

  static const LinearGradient focusBlockGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2C2C2C), Color(0xFF1E1E1E)],
  );

  // === BUTTON COLORS ===

  /// Contained button (emphasized)
  static const Color buttonContainedLight = Color(0xFF0078D4);
  static const Color buttonContainedDark = Color(0xFF0A84FF);

  /// Outlined button
  static const Color buttonOutlinedLight = Color(0xFF0078D4);
  static const Color buttonOutlinedDark = Color(0xFF0A84FF);

  /// Text button
  static const Color buttonTextLight = Color(0xFF0078D4);
  static const Color buttonTextDark = Color(0xFF0A84FF);

  /// Disabled button
  static const Color buttonDisabledLight = Color(0xFFE0E0E0);
  static const Color buttonDisabledDark = Color(0xFF383838);

  // === DIVIDER & BORDER COLORS ===

  static const Color dividerLight = Color(0xFFE0E0E0);
  static const Color dividerDark = Color(0xFF383838);

  static const Color borderLight = Color(0xFFE0E0E0);
  static const Color borderDark = Color(0xFF383838);

  // === OVERLAY & SHADOW COLORS ===

  static const Color overlayLight = Color(0x1F000000);
  static const Color overlayDark = Color(0x3FFFFFFF);

  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowDark = Color(0x3F000000);

  // === RIPPLE EFFECT ===

  static const Color rippleLight = Color(0x1F000000);
  static const Color rippleDark = Color(0x3FFFFFFF);
}