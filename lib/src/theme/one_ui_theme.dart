import 'package:flutter/material.dart';

import '../constants/one_ui_colors.dart';
import '../constants/one_ui_dimensions.dart';
import '../constants/one_ui_typography.dart';

/// Samsung One UI Theme
///
/// Provides complete theme configuration for light and dark modes
/// following official One UI design guidelines
class OneUITheme {
  OneUITheme._();

  // === LIGHT THEME ===

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Colors
      primaryColor: OneUIColors.primaryBlue,
      scaffoldBackgroundColor: OneUIColors.backgroundLight,
      cardColor: OneUIColors.cardLight,
      dividerColor: OneUIColors.dividerLight,

      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: OneUIColors.primaryBlue,
        secondary: OneUIColors.primaryLight,
        error: OneUIColors.error,
        surface: OneUIColors.surfaceLight,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: OneUIColors.textPrimaryLight,
        onError: Colors.white,
      ),

      // Typography
      textTheme: OneUITypography.createTextTheme(
        color: OneUIColors.textPrimaryLight,
      ),

      // App Bar Theme
      appBarTheme: AppBarTheme(
        elevation: OneUIElevation.appBar,
        centerTitle: false,
        backgroundColor: OneUIColors.backgroundLight,
        foregroundColor: OneUIColors.textPrimaryLight,
        titleTextStyle: OneUITypography.appBarTitle.copyWith(
          color: OneUIColors.textPrimaryLight,
        ),
        iconTheme: const IconThemeData(
          color: OneUIColors.textPrimaryLight,
          size: OneUIIconSize.md,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        elevation: OneUIElevation.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(OneUIRadius.card),
        ),
        color: OneUIColors.cardLight,
        margin: const EdgeInsets.all(OneUISpacing.xs),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: OneUIElevation.button,
          backgroundColor: OneUIColors.buttonContainedLight,
          foregroundColor: Colors.white,
          minimumSize: const Size(0, OneUISpacing.minTouchTarget),
          padding: const EdgeInsets.symmetric(
            horizontal: OneUISpacing.xl,
            vertical: OneUISpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(OneUIRadius.button),
          ),
          textStyle: OneUITypography.button,
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: OneUIColors.buttonOutlinedLight,
          minimumSize: const Size(0, OneUISpacing.minTouchTarget),
          padding: const EdgeInsets.symmetric(
            horizontal: OneUISpacing.xl,
            vertical: OneUISpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(OneUIRadius.button),
          ),
          side: const BorderSide(
            color: OneUIColors.buttonOutlinedLight,
            width: 2.0,
          ),
          textStyle: OneUITypography.button,
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: OneUIColors.buttonTextLight,
          minimumSize: const Size(0, OneUISpacing.minTouchTarget),
          padding: const EdgeInsets.symmetric(
            horizontal: OneUISpacing.lg,
            vertical: OneUISpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(OneUIRadius.button),
          ),
          textStyle: OneUITypography.button,
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: OneUIColors.surfaceLight,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: OneUISpacing.md,
          vertical: OneUISpacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(OneUIRadius.input),
          borderSide: const BorderSide(
            color: OneUIColors.borderLight,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(OneUIRadius.input),
          borderSide: const BorderSide(
            color: OneUIColors.borderLight,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(OneUIRadius.input),
          borderSide: const BorderSide(
            color: OneUIColors.primaryBlue,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(OneUIRadius.input),
          borderSide: const BorderSide(
            color: OneUIColors.error,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(OneUIRadius.input),
          borderSide: const BorderSide(
            color: OneUIColors.error,
            width: 2.0,
          ),
        ),
        labelStyle: OneUITypography.bodyMedium.copyWith(
          color: OneUIColors.textSecondaryLight,
        ),
        hintStyle: OneUITypography.bodyMedium.copyWith(
          color: OneUIColors.textDisabledLight,
        ),
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: OneUIColors.primaryBlue,
        foregroundColor: Colors.white,
        elevation: OneUIElevation.lg,
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: OneUIColors.surfaceLight,
        selectedColor: OneUIColors.primaryBlue,
        disabledColor: OneUIColors.buttonDisabledLight,
        padding: const EdgeInsets.symmetric(
          horizontal: OneUISpacing.sm,
          vertical: OneUISpacing.xs,
        ),
        labelStyle: OneUITypography.labelMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(OneUIRadius.chip),
        ),
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        elevation: OneUIElevation.dialog,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(OneUIRadius.dialog),
        ),
        backgroundColor: OneUIColors.backgroundLight,
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: BottomSheetThemeData(
        elevation: OneUIElevation.bottomSheet,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(OneUIRadius.bottomSheet),
          ),
        ),
        backgroundColor: OneUIColors.backgroundLight,
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: OneUIColors.dividerLight,
        thickness: 1.0,
        space: OneUISpacing.md,
      ),

      // Icon Theme
      iconTheme: const IconThemeData(
        color: OneUIColors.textPrimaryLight,
        size: OneUIIconSize.md,
      ),
    );
  }

  // === DARK THEME ===

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Colors
      primaryColor: OneUIColors.primaryBlueDark,
      scaffoldBackgroundColor: OneUIColors.backgroundDark,
      cardColor: OneUIColors.cardDark,
      dividerColor: OneUIColors.dividerDark,

      // Color Scheme
      colorScheme: const ColorScheme.dark(
        primary: OneUIColors.primaryBlueDark,
        secondary: OneUIColors.primaryLight,
        error: OneUIColors.errorDark,
        surface: OneUIColors.surfaceDark,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: OneUIColors.textPrimaryDark,
        onError: Colors.black,
      ),

      // Typography
      textTheme: OneUITypography.createTextTheme(
        color: OneUIColors.textPrimaryDark,
      ),

      // App Bar Theme
      appBarTheme: AppBarTheme(
        elevation: OneUIElevation.appBar,
        centerTitle: false,
        backgroundColor: OneUIColors.backgroundDark,
        foregroundColor: OneUIColors.textPrimaryDark,
        titleTextStyle: OneUITypography.appBarTitle.copyWith(
          color: OneUIColors.textPrimaryDark,
        ),
        iconTheme: const IconThemeData(
          color: OneUIColors.textPrimaryDark,
          size: OneUIIconSize.md,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        elevation: OneUIElevation.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(OneUIRadius.card),
        ),
        color: OneUIColors.cardDark,
        margin: const EdgeInsets.all(OneUISpacing.xs),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: OneUIElevation.button,
          backgroundColor: OneUIColors.buttonContainedDark,
          foregroundColor: Colors.black,
          minimumSize: const Size(0, OneUISpacing.minTouchTarget),
          padding: const EdgeInsets.symmetric(
            horizontal: OneUISpacing.xl,
            vertical: OneUISpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(OneUIRadius.button),
          ),
          textStyle: OneUITypography.button,
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: OneUIColors.buttonOutlinedDark,
          minimumSize: const Size(0, OneUISpacing.minTouchTarget),
          padding: const EdgeInsets.symmetric(
            horizontal: OneUISpacing.xl,
            vertical: OneUISpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(OneUIRadius.button),
          ),
          side: const BorderSide(
            color: OneUIColors.buttonOutlinedDark,
            width: 2.0,
          ),
          textStyle: OneUITypography.button,
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: OneUIColors.buttonTextDark,
          minimumSize: const Size(0, OneUISpacing.minTouchTarget),
          padding: const EdgeInsets.symmetric(
            horizontal: OneUISpacing.lg,
            vertical: OneUISpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(OneUIRadius.button),
          ),
          textStyle: OneUITypography.button,
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: OneUIColors.surfaceDark,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: OneUISpacing.md,
          vertical: OneUISpacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(OneUIRadius.input),
          borderSide: const BorderSide(
            color: OneUIColors.borderDark,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(OneUIRadius.input),
          borderSide: const BorderSide(
            color: OneUIColors.borderDark,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(OneUIRadius.input),
          borderSide: const BorderSide(
            color: OneUIColors.primaryBlueDark,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(OneUIRadius.input),
          borderSide: const BorderSide(
            color: OneUIColors.errorDark,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(OneUIRadius.input),
          borderSide: const BorderSide(
            color: OneUIColors.errorDark,
            width: 2.0,
          ),
        ),
        labelStyle: OneUITypography.bodyMedium.copyWith(
          color: OneUIColors.textSecondaryDark,
        ),
        hintStyle: OneUITypography.bodyMedium.copyWith(
          color: OneUIColors.textDisabledDark,
        ),
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: OneUIColors.primaryBlueDark,
        foregroundColor: Colors.black,
        elevation: OneUIElevation.lg,
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: OneUIColors.surfaceDark,
        selectedColor: OneUIColors.primaryBlueDark,
        disabledColor: OneUIColors.buttonDisabledDark,
        padding: const EdgeInsets.symmetric(
          horizontal: OneUISpacing.sm,
          vertical: OneUISpacing.xs,
        ),
        labelStyle: OneUITypography.labelMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(OneUIRadius.chip),
        ),
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        elevation: OneUIElevation.dialog,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(OneUIRadius.dialog),
        ),
        backgroundColor: OneUIColors.backgroundDark,
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: BottomSheetThemeData(
        elevation: OneUIElevation.bottomSheet,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(OneUIRadius.bottomSheet),
          ),
        ),
        backgroundColor: OneUIColors.backgroundDark,
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: OneUIColors.dividerDark,
        thickness: 1.0,
        space: OneUISpacing.md,
      ),

      // Icon Theme
      iconTheme: const IconThemeData(
        color: OneUIColors.textPrimaryDark,
        size: OneUIIconSize.md,
      ),
    );
  }
}