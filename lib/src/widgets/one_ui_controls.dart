import 'package:flutter/material.dart';
import '../constants/one_ui_colors.dart';
import '../constants/one_ui_dimensions.dart';
import '../constants/one_ui_typography.dart';

/// Samsung One UI Switch
class OneUISwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;
  final Color? inactiveColor;

  const OneUISwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor ??
          (isDark ? OneUIColors.primaryBlueDark : OneUIColors.primaryBlue),
      inactiveThumbColor: inactiveColor,
      activeTrackColor: (activeColor ??
          (isDark ? OneUIColors.primaryBlueDark : OneUIColors.primaryBlue))
          .withOpacity(0.5),
    );
  }
}

/// Switch with label
class OneUISwitchTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Widget? leading;

  const OneUISwitchTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    this.onChanged,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return InkWell(
      onTap: onChanged != null ? () => onChanged!(!value) : null,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: OneUISpacing.md,
          vertical: OneUISpacing.sm,
        ),
        child: Row(
          children: [
            if (leading != null) ...[
              leading!,
              SizedBox(width: OneUISpacing.md),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: OneUITypography.titleMedium.copyWith(
                      color: isDark
                          ? OneUIColors.textPrimaryDark
                          : OneUIColors.textPrimaryLight,
                    ),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: OneUISpacing.xxs),
                    Text(
                      subtitle!,
                      style: OneUITypography.bodySmall.copyWith(
                        color: isDark
                            ? OneUIColors.textSecondaryDark
                            : OneUIColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            OneUISwitch(
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}

/// Samsung One UI Checkbox
class OneUICheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Color? activeColor;

  const OneUICheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Checkbox(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor ??
          (isDark ? OneUIColors.primaryBlueDark : OneUIColors.primaryBlue),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}

/// Checkbox with label
class OneUICheckboxTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Widget? leading;

  const OneUICheckboxTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    this.onChanged,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return InkWell(
      onTap: onChanged != null ? () => onChanged!(!value) : null,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: OneUISpacing.md,
          vertical: OneUISpacing.sm,
        ),
        child: Row(
          children: [
            OneUICheckbox(
              value: value,
              onChanged: onChanged,
            ),
            SizedBox(width: OneUISpacing.sm),
            if (leading != null) ...[
              leading!,
              SizedBox(width: OneUISpacing.sm),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: OneUITypography.titleMedium.copyWith(
                      color: isDark
                          ? OneUIColors.textPrimaryDark
                          : OneUIColors.textPrimaryLight,
                    ),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: OneUISpacing.xxs),
                    Text(
                      subtitle!,
                      style: OneUITypography.bodySmall.copyWith(
                        color: isDark
                            ? OneUIColors.textSecondaryDark
                            : OneUIColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Samsung One UI Radio Button
class OneUIRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final Color? activeColor;

  const OneUIRadio({
    super.key,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Radio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: activeColor ??
          (isDark ? OneUIColors.primaryBlueDark : OneUIColors.primaryBlue),
    );
  }
}

/// Radio button with label
class OneUIRadioTile<T> extends StatelessWidget {
  final String title;
  final String? subtitle;
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final Widget? leading;

  const OneUIRadioTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return InkWell(
      onTap: onChanged != null ? () => onChanged!(value) : null,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: OneUISpacing.md,
          vertical: OneUISpacing.sm,
        ),
        child: Row(
          children: [
            OneUIRadio<T>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            SizedBox(width: OneUISpacing.sm),
            if (leading != null) ...[
              leading!,
              SizedBox(width: OneUISpacing.sm),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: OneUITypography.titleMedium.copyWith(
                      color: isDark
                          ? OneUIColors.textPrimaryDark
                          : OneUIColors.textPrimaryLight,
                    ),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: OneUISpacing.xxs),
                    Text(
                      subtitle!,
                      style: OneUITypography.bodySmall.copyWith(
                        color: isDark
                            ? OneUIColors.textSecondaryDark
                            : OneUIColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Samsung One UI Slider
class OneUISlider extends StatelessWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final double min;
  final double max;
  final int? divisions;
  final String? label;
  final Color? activeColor;

  const OneUISlider({
    super.key,
    required this.value,
    this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.label,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 4.0,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 16.0),
        activeTrackColor: activeColor ??
            (isDark ? OneUIColors.primaryBlueDark : OneUIColors.primaryBlue),
        inactiveTrackColor:
        isDark ? OneUIColors.borderDark : OneUIColors.borderLight,
        thumbColor: activeColor ??
            (isDark ? OneUIColors.primaryBlueDark : OneUIColors.primaryBlue),
        overlayColor: (activeColor ??
            (isDark ? OneUIColors.primaryBlueDark : OneUIColors.primaryBlue))
            .withOpacity(0.2),
        valueIndicatorColor: activeColor ??
            (isDark ? OneUIColors.primaryBlueDark : OneUIColors.primaryBlue),
      ),
      child: Slider(
        value: value,
        onChanged: onChanged,
        min: min,
        max: max,
        divisions: divisions,
        label: label,
      ),
    );
  }
}

/// Chip in One UI style
class OneUIChip extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final VoidCallback? onDeleted;
  final Widget? avatar;
  final bool selected;
  final Color? backgroundColor;
  final Color? selectedColor;

  const OneUIChip({
    super.key,
    required this.label,
    this.onTap,
    this.onDeleted,
    this.avatar,
    this.selected = false,
    this.backgroundColor,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (onDeleted != null) {
      return Chip(
        label: Text(label),
        onDeleted: onDeleted,
        avatar: avatar,
        backgroundColor: backgroundColor ??
            (isDark ? OneUIColors.surfaceDark : OneUIColors.surfaceLight),
        deleteIconColor: isDark
            ? OneUIColors.textSecondaryDark
            : OneUIColors.textSecondaryLight,
        labelStyle: OneUITypography.labelMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(OneUIRadius.chip),
        ),
      );
    }

    if (selected) {
      return ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: onTap != null ? (_) => onTap!() : null,
        avatar: avatar,
        selectedColor: selectedColor ??
            (isDark ? OneUIColors.primaryBlueDark : OneUIColors.primaryBlue),
        backgroundColor: backgroundColor ??
            (isDark ? OneUIColors.surfaceDark : OneUIColors.surfaceLight),
        labelStyle: OneUITypography.labelMedium.copyWith(
          color: selected ? Colors.white : null,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(OneUIRadius.chip),
        ),
      );
    }

    return ActionChip(
      label: Text(label),
      onPressed: onTap,
      avatar: avatar,
      backgroundColor: backgroundColor ??
          (isDark ? OneUIColors.surfaceDark : OneUIColors.surfaceLight),
      labelStyle: OneUITypography.labelMedium,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(OneUIRadius.chip),
      ),
    );
  }
}