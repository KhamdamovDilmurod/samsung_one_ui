import 'package:flutter/material.dart';
import '../constants/one_ui_colors.dart';
import '../constants/one_ui_dimensions.dart';
import '../constants/one_ui_typography.dart';

/// Samsung One UI Button
///
/// Provides three button variants:
/// - Contained (filled): Primary actions with background color
/// - Outlined: Secondary actions with border
/// - Text: Tertiary actions without background
///
/// Based on official One UI design guidelines with 18dp corner radius
enum OneUIButtonType {
  contained,
  outlined,
  text,
}

enum OneUIButtonSize {
  small,
  medium,
  large,
}

class OneUIButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final OneUIButtonType type;
  final OneUIButtonSize size;
  final Widget? leading;
  final Widget? trailing;
  final bool isLoading;
  final bool isFullWidth;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;

  const OneUIButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = OneUIButtonType.contained,
    this.size = OneUIButtonSize.medium,
    this.leading,
    this.trailing,
    this.isLoading = false,
    this.isFullWidth = false,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
  });

  /// Contained button (filled)
  factory OneUIButton.contained({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    OneUIButtonSize size = OneUIButtonSize.medium,
    Widget? leading,
    Widget? trailing,
    bool isLoading = false,
    bool isFullWidth = false,
    Color? backgroundColor,
    Color? foregroundColor,
  }) {
    return OneUIButton(
      key: key,
      text: text,
      onPressed: onPressed,
      type: OneUIButtonType.contained,
      size: size,
      leading: leading,
      trailing: trailing,
      isLoading: isLoading,
      isFullWidth: isFullWidth,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
    );
  }

  /// Outlined button
  factory OneUIButton.outlined({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    OneUIButtonSize size = OneUIButtonSize.medium,
    Widget? leading,
    Widget? trailing,
    bool isLoading = false,
    bool isFullWidth = false,
    Color? foregroundColor,
    Color? borderColor,
  }) {
    return OneUIButton(
      key: key,
      text: text,
      onPressed: onPressed,
      type: OneUIButtonType.outlined,
      size: size,
      leading: leading,
      trailing: trailing,
      isLoading: isLoading,
      isFullWidth: isFullWidth,
      foregroundColor: foregroundColor,
      borderColor: borderColor,
    );
  }

  /// Text button (flat)
  factory OneUIButton.text({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    OneUIButtonSize size = OneUIButtonSize.medium,
    Widget? leading,
    Widget? trailing,
    bool isLoading = false,
    bool isFullWidth = false,
    Color? foregroundColor,
  }) {
    return OneUIButton(
      key: key,
      text: text,
      onPressed: onPressed,
      type: OneUIButtonType.text,
      size: size,
      leading: leading,
      trailing: trailing,
      isLoading: isLoading,
      isFullWidth: isFullWidth,
      foregroundColor: foregroundColor,
    );
  }

  double get _height {
    switch (size) {
      case OneUIButtonSize.small:
        return 40.0;
      case OneUIButtonSize.medium:
        return OneUISpacing.minTouchTarget;
      case OneUIButtonSize.large:
        return OneUISpacing.largeTouchTarget;
    }
  }

  double get _horizontalPadding {
    switch (size) {
      case OneUIButtonSize.small:
        return OneUISpacing.md;
      case OneUIButtonSize.medium:
        return OneUISpacing.xl;
      case OneUIButtonSize.large:
        return OneUISpacing.xxl;
    }
  }

  double get _verticalPadding {
    switch (size) {
      case OneUIButtonSize.small:
        return OneUISpacing.xs;
      case OneUIButtonSize.medium:
        return OneUISpacing.md;
      case OneUIButtonSize.large:
        return OneUISpacing.lg;
    }
  }

  double get _fontSize {
    switch (size) {
      case OneUIButtonSize.small:
        return 12.0;
      case OneUIButtonSize.medium:
        return 14.0;
      case OneUIButtonSize.large:
        return 16.0;
    }
  }

  double get _borderRadius {
    switch (size) {
      case OneUIButtonSize.small:
        return OneUIRadius.buttonSmall;
      case OneUIButtonSize.medium:
        return OneUIRadius.button;
      case OneUIButtonSize.large:
        return OneUIRadius.buttonLarge;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final Widget content = Row(
      mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leading != null && !isLoading) ...[
          leading!,
          SizedBox(width: OneUISpacing.xs),
        ],
        if (isLoading)
          SizedBox(
            width: _fontSize + 4,
            height: _fontSize + 4,
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation<Color>(
                type == OneUIButtonType.contained
                    ? (foregroundColor ?? Colors.white)
                    : (foregroundColor ??
                    (isDark
                        ? OneUIColors.primaryBlueDark
                        : OneUIColors.primaryBlue)),
              ),
            ),
          )
        else
          Text(
            text,
            style: OneUITypography.button.copyWith(
              fontSize: _fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        if (trailing != null && !isLoading) ...[
          SizedBox(width: OneUISpacing.xs),
          trailing!,
        ],
      ],
    );

    final buttonChild = Container(
      width: isFullWidth ? double.infinity : null,
      height: _height,
      child: content,
    );

    switch (type) {
      case OneUIButtonType.contained:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ??
                (isDark
                    ? OneUIColors.buttonContainedDark
                    : OneUIColors.buttonContainedLight),
            foregroundColor: foregroundColor ??
                (isDark ? Colors.black : Colors.white),
            elevation: OneUIElevation.button,
            disabledBackgroundColor: isDark
                ? OneUIColors.buttonDisabledDark
                : OneUIColors.buttonDisabledLight,
            padding: EdgeInsets.symmetric(
              horizontal: _horizontalPadding,
              vertical: _verticalPadding,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_borderRadius),
            ),
            minimumSize: Size(0, _height),
          ),
          child: content,
        );

      case OneUIButtonType.outlined:
        return OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: foregroundColor ??
                (isDark
                    ? OneUIColors.buttonOutlinedDark
                    : OneUIColors.buttonOutlinedLight),
            side: BorderSide(
              color: borderColor ??
                  (foregroundColor ??
                      (isDark
                          ? OneUIColors.buttonOutlinedDark
                          : OneUIColors.buttonOutlinedLight)),
              width: 2.0,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: _horizontalPadding,
              vertical: _verticalPadding,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_borderRadius),
            ),
            minimumSize: Size(0, _height),
          ),
          child: content,
        );

      case OneUIButtonType.text:
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            foregroundColor: foregroundColor ??
                (isDark
                    ? OneUIColors.buttonTextDark
                    : OneUIColors.buttonTextLight),
            padding: EdgeInsets.symmetric(
              horizontal: _horizontalPadding,
              vertical: _verticalPadding,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_borderRadius),
            ),
            minimumSize: Size(0, _height),
          ),
          child: content,
        );
    }
  }
}

/// Icon Button for One UI
class OneUIIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? backgroundColor;
  final double? size;
  final String? tooltip;

  const OneUIIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.color,
    this.backgroundColor,
    this.size,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final iconSize = size ?? OneUIIconSize.md;

    final button = Material(
      color: backgroundColor ?? Colors.transparent,
      borderRadius: BorderRadius.circular(OneUIRadius.button),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(OneUIRadius.button),
        child: Container(
          width: OneUISpacing.minTouchTarget,
          height: OneUISpacing.minTouchTarget,
          alignment: Alignment.center,
          child: Icon(
            icon,
            size: iconSize,
            color: color ??
                (isDark
                    ? OneUIColors.textPrimaryDark
                    : OneUIColors.textPrimaryLight),
          ),
        ),
      ),
    );

    if (tooltip != null) {
      return Tooltip(
        message: tooltip!,
        child: button,
      );
    }

    return button;
  }
}