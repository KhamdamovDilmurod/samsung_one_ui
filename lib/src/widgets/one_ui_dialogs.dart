import 'package:flutter/material.dart';
import '../constants/one_ui_colors.dart';
import '../constants/one_ui_dimensions.dart';
import '../constants/one_ui_typography.dart';
import 'one_ui_button.dart';

/// Samsung One UI Dialog
///
/// Shows a dialog with One UI styling
class OneUIDialog extends StatelessWidget {
  final String? title;
  final Widget? content;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? contentPadding;
  final bool barrierDismissible;

  const OneUIDialog({
    super.key,
    this.title,
    this.content,
    this.actions,
    this.contentPadding,
    this.barrierDismissible = true,
  });

  /// Show dialog
  static Future<T?> show<T>({
    required BuildContext context,
    String? title,
    Widget? content,
    List<Widget>? actions,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => OneUIDialog(
        title: title,
        content: content,
        actions: actions,
        barrierDismissible: barrierDismissible,
      ),
    );
  }

  /// Show confirmation dialog
  static Future<bool?> showConfirmation({
    required BuildContext context,
    String? title,
    String? message,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
  }) {
    return show<bool>(
      context: context,
      title: title,
      content: message != null ? Text(message) : null,
      actions: [
        OneUIButton.text(
          text: cancelText,
          onPressed: () => Navigator.of(context).pop(false),
        ),
        OneUIButton.contained(
          text: confirmText,
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Dialog(
      backgroundColor: isDark ? OneUIColors.backgroundDark : OneUIColors.backgroundLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(OneUIRadius.dialog),
      ),
      child: Padding(
        padding: contentPadding ?? EdgeInsets.all(OneUISpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Text(
                title!,
                style: OneUITypography.titleLarge.copyWith(
                  color: isDark
                      ? OneUIColors.textPrimaryDark
                      : OneUIColors.textPrimaryLight,
                ),
              ),
              SizedBox(height: OneUISpacing.md),
            ],
            if (content != null) ...[
              DefaultTextStyle(
                style: OneUITypography.bodyMedium.copyWith(
                  color: isDark
                      ? OneUIColors.textSecondaryDark
                      : OneUIColors.textSecondaryLight,
                ),
                child: content!,
              ),
              if (actions != null && actions!.isNotEmpty)
                SizedBox(height: OneUISpacing.lg),
            ],
            if (actions != null && actions!.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  for (int i = 0; i < actions!.length; i++) ...[
                    if (i > 0) SizedBox(width: OneUISpacing.sm),
                    actions![i],
                  ],
                ],
              ),
          ],
        ),
      ),
    );
  }
}

/// Samsung One UI Bottom Sheet
///
/// Shows a bottom sheet with One UI styling
class OneUIBottomSheet extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool showHandle;
  final EdgeInsetsGeometry? padding;

  const OneUIBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.showHandle = true,
    this.padding,
  });

  /// Show modal bottom sheet
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    bool showHandle = true,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: true,
      builder: (context) => OneUIBottomSheet(
        title: title,
        showHandle: showHandle,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? OneUIColors.backgroundDark : OneUIColors.backgroundLight,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(OneUIRadius.bottomSheet),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showHandle) ...[
              SizedBox(height: OneUISpacing.sm),
              Container(
                width: 32,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark
                      ? OneUIColors.dividerDark
                      : OneUIColors.dividerLight,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
            if (title != null) ...[
              Padding(
                padding: EdgeInsets.all(OneUISpacing.md),
                child: Text(
                  title!,
                  style: OneUITypography.titleLarge.copyWith(
                    color: isDark
                        ? OneUIColors.textPrimaryDark
                        : OneUIColors.textPrimaryLight,
                  ),
                ),
              ),
              Divider(
                height: 1,
                color: isDark ? OneUIColors.dividerDark : OneUIColors.dividerLight,
              ),
            ],
            Padding(
              padding: padding ?? EdgeInsets.all(OneUISpacing.md),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

/// Action Bottom Sheet (List of options)
class OneUIActionSheet extends StatelessWidget {
  final String? title;
  final List<OneUIActionSheetItem> items;

  const OneUIActionSheet({
    super.key,
    this.title,
    required this.items,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    String? title,
    required List<OneUIActionSheetItem> items,
  }) {
    return OneUIBottomSheet.show<T>(
      context: context,
      title: title,
      child: OneUIActionSheet(
        title: title,
        items: items,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final item in items)
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              item.onTap?.call();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: OneUISpacing.md,
                vertical: OneUISpacing.md,
              ),
              child: Row(
                children: [
                  if (item.icon != null) ...[
                    Icon(
                      item.icon,
                      color: item.isDestructive
                          ? OneUIColors.error
                          : null,
                    ),
                    SizedBox(width: OneUISpacing.md),
                  ],
                  Expanded(
                    child: Text(
                      item.title,
                      style: OneUITypography.bodyLarge.copyWith(
                        color: item.isDestructive
                            ? OneUIColors.error
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

/// Action Sheet Item
class OneUIActionSheetItem {
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool isDestructive;

  const OneUIActionSheetItem({
    required this.title,
    this.icon,
    this.onTap,
    this.isDestructive = false,
  });
}

/// Snackbar in One UI style
class OneUISnackBar {
  /// Show a snackbar
  static void show({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    String? actionLabel,
    VoidCallback? onAction,
    bool isError = false,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        backgroundColor: isError
            ? (isDark ? OneUIColors.errorDark : OneUIColors.error)
            : (isDark ? OneUIColors.cardDark : OneUIColors.cardLight),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(OneUIRadius.button),
        ),
        action: actionLabel != null
            ? SnackBarAction(
          label: actionLabel,
          onPressed: onAction ?? () {},
          textColor: isDark
              ? OneUIColors.primaryBlueDark
              : OneUIColors.primaryBlue,
        )
            : null,
      ),
    );
  }

  /// Show success message
  static void showSuccess({
    required BuildContext context,
    required String message,
  }) {
    show(context: context, message: message);
  }

  /// Show error message
  static void showError({
    required BuildContext context,
    required String message,
  }) {
    show(context: context, message: message, isError: true);
  }
}