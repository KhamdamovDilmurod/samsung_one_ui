import 'package:flutter/material.dart';
import '../constants/one_ui_colors.dart';
import '../constants/one_ui_dimensions.dart';
import '../constants/one_ui_typography.dart';

/// Samsung One UI Card (Focus Block)
///
/// Based on One UI design guidelines for focus blocks
/// with large rounded corners (26dp) to capture user attention
class OneUICard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? elevation;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final BorderRadius? borderRadius;
  final Border? border;
  final Gradient? gradient;

  const OneUICard({
    super.key,
    this.child,
    this.padding,
    this.margin,
    this.color,
    this.elevation,
    this.onTap,
    this.onLongPress,
    this.borderRadius,
    this.border,
    this.gradient,
  });

  /// Small card variant
  factory OneUICard.small({
    Key? key,
    Widget? child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? color,
    double? elevation,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
  }) {
    return OneUICard(
      key: key,
      padding: padding ?? EdgeInsets.all(OneUISpacing.sm),
      margin: margin,
      color: color,
      elevation: elevation,
      onTap: onTap,
      onLongPress: onLongPress,
      borderRadius: BorderRadius.circular(OneUIRadius.cardSmall),
      child: child,
    );
  }

  /// Large card variant
  factory OneUICard.large({
    Key? key,
    Widget? child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? color,
    double? elevation,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
  }) {
    return OneUICard(
      key: key,
      padding: padding ?? EdgeInsets.all(OneUISpacing.lg),
      margin: margin,
      color: color,
      elevation: elevation,
      onTap: onTap,
      onLongPress: onLongPress,
      borderRadius: BorderRadius.circular(OneUIRadius.cardLarge),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final cardColor = color ??
        (isDark ? OneUIColors.cardDark : OneUIColors.cardLight);

    final cardElevation = elevation ?? OneUIElevation.card;
    final cardBorderRadius = borderRadius ?? BorderRadius.circular(OneUIRadius.card);

    Widget content = Container(
      padding: padding ?? EdgeInsets.all(OneUISpacing.md),
      decoration: BoxDecoration(
        color: gradient == null ? cardColor : null,
        gradient: gradient,
        borderRadius: cardBorderRadius,
        border: border,
        boxShadow: cardElevation > 0
            ? [
          BoxShadow(
            color: isDark ? OneUIColors.shadowDark : OneUIColors.shadowLight,
            blurRadius: cardElevation * 2,
            offset: Offset(0, cardElevation / 2),
          ),
        ]
            : null,
      ),
      child: child,
    );

    if (onTap != null || onLongPress != null) {
      content = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          borderRadius: cardBorderRadius,
          child: content,
        ),
      );
    }

    if (margin != null) {
      content = Padding(
        padding: margin!,
        child: content,
      );
    }

    return content;
  }
}

/// Focus Block Type 1 (Most frequently used)
class OneUIFocusBlock extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const OneUIFocusBlock({
    super.key,
    required this.child,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return OneUICard(
      color: isDark ? OneUIColors.focusBlock1Dark : OneUIColors.focusBlock1Light,
      padding: padding ?? EdgeInsets.all(OneUISpacing.md),
      margin: margin,
      elevation: 0,
      child: child,
    );
  }
}

/// Container with One UI styling
class OneUIContainer extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final Border? border;
  final BorderRadius? borderRadius;
  final Gradient? gradient;
  final List<BoxShadow>? boxShadow;

  const OneUIContainer({
    super.key,
    this.child,
    this.padding,
    this.margin,
    this.color,
    this.width,
    this.height,
    this.alignment,
    this.border,
    this.borderRadius,
    this.gradient,
    this.boxShadow,
  });

  /// Container with border
  factory OneUIContainer.bordered({
    Key? key,
    Widget? child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? color,
    Color? borderColor,
    double borderWidth = 1.0,
    double? width,
    double? height,
    AlignmentGeometry? alignment,
  }) {
    return OneUIContainer(
      key: key,
      padding: padding,
      margin: margin,
      color: color,
      width: width,
      height: height,
      alignment: alignment,
      borderRadius: BorderRadius.circular(OneUIRadius.card),
      border: Border.all(
        color: borderColor ?? OneUIColors.borderLight,
        width: borderWidth,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        border: border,
        borderRadius: borderRadius ?? BorderRadius.circular(OneUIRadius.medium),
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}

/// List tile in One UI style
class OneUIListTile extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  const OneUIListTile({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.padding,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Material(
      color: backgroundColor ?? Colors.transparent,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Padding(
          padding: padding ??
              EdgeInsets.symmetric(
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
                    DefaultTextStyle(
                      style: OneUITypography.titleMedium.copyWith(
                        color: isDark
                            ? OneUIColors.textPrimaryDark
                            : OneUIColors.textPrimaryLight,
                      ),
                      child: title,
                    ),
                    if (subtitle != null) ...[
                      SizedBox(height: OneUISpacing.xxs),
                      DefaultTextStyle(
                        style: OneUITypography.bodySmall.copyWith(
                          color: isDark
                              ? OneUIColors.textSecondaryDark
                              : OneUIColors.textSecondaryLight,
                        ),
                        child: subtitle!,
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null) ...[
                SizedBox(width: OneUISpacing.md),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Divider in One UI style
class OneUIDivider extends StatelessWidget {
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final Color? color;

  const OneUIDivider({
    super.key,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Divider(
      thickness: thickness ?? 1.0,
      indent: indent,
      endIndent: endIndent,
      color: color ?? (isDark ? OneUIColors.dividerDark : OneUIColors.dividerLight),
    );
  }
}