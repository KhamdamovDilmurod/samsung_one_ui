import 'package:flutter/material.dart';
import '../constants/one_ui_colors.dart';
import '../constants/one_ui_dimensions.dart';
import '../constants/one_ui_typography.dart';

/// Samsung One UI Loading Indicator
///
/// Circular progress indicator following One UI design guidelines
class OneUILoadingIndicator extends StatelessWidget {
  final double? size;
  final double? strokeWidth;
  final Color? color;
  final Color? backgroundColor;

  const OneUILoadingIndicator({
    super.key,
    this.size,
    this.strokeWidth,
    this.color,
    this.backgroundColor,
  });

  /// Small loading indicator
  const OneUILoadingIndicator.small({
    super.key,
    this.strokeWidth = 2.0,
    this.color,
    this.backgroundColor,
  }) : size = 20.0;

  /// Medium loading indicator (default)
  const OneUILoadingIndicator.medium({
    super.key,
    this.strokeWidth = 3.0,
    this.color,
    this.backgroundColor,
  }) : size = 32.0;

  /// Large loading indicator
  const OneUILoadingIndicator.large({
    super.key,
    this.strokeWidth = 4.0,
    this.color,
    this.backgroundColor,
  }) : size = 48.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final indicatorColor = color ??
        (isDark ? OneUIColors.primaryBlueDark : OneUIColors.primaryBlue);

    return SizedBox(
      width: size ?? 32.0,
      height: size ?? 32.0,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
        backgroundColor: backgroundColor,
      ),
    );
  }
}

/// Loading overlay with text
class OneUILoadingOverlay extends StatelessWidget {
  final String? message;
  final bool isVisible;

  const OneUILoadingOverlay({
    super.key,
    this.message,
    this.isVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      color: (isDark ? OneUIColors.overlayDark : OneUIColors.overlayLight),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(OneUISpacing.xl),
          decoration: BoxDecoration(
            color: isDark ? OneUIColors.cardDark : OneUIColors.cardLight,
            borderRadius: BorderRadius.circular(OneUIRadius.card),
            boxShadow: [
              BoxShadow(
                color: isDark ? OneUIColors.shadowDark : OneUIColors.shadowLight,
                blurRadius: 16.0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const OneUILoadingIndicator.large(),
              if (message != null) ...[
                SizedBox(height: OneUISpacing.md),
                Text(
                  message!,
                  style: OneUITypography.bodyLarge.copyWith(
                    color: isDark
                        ? OneUIColors.textPrimaryDark
                        : OneUIColors.textPrimaryLight,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Linear progress indicator
class OneUILinearProgress extends StatelessWidget {
  final double? value;
  final Color? color;
  final Color? backgroundColor;
  final double height;

  const OneUILinearProgress({
    super.key,
    this.value,
    this.color,
    this.backgroundColor,
    this.height = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final progressColor = color ??
        (isDark ? OneUIColors.primaryBlueDark : OneUIColors.primaryBlue);

    final bgColor = backgroundColor ??
        (isDark ? OneUIColors.surfaceDark : OneUIColors.surfaceLight);

    return ClipRRect(
      borderRadius: BorderRadius.circular(height / 2),
      child: SizedBox(
        height: height,
        child: LinearProgressIndicator(
          value: value,
          valueColor: AlwaysStoppedAnimation<Color>(progressColor),
          backgroundColor: bgColor,
        ),
      ),
    );
  }
}

/// Shimmer loading effect for content placeholders
class OneUIShimmer extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  final Color? baseColor;
  final Color? highlightColor;

  const OneUIShimmer({
    super.key,
    required this.child,
    this.isLoading = true,
    this.baseColor,
    this.highlightColor,
  });

  @override
  State<OneUIShimmer> createState() => _OneUIShimmerState();
}

class _OneUIShimmerState extends State<OneUIShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) return widget.child;

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final baseColor = widget.baseColor ??
        (isDark ? OneUIColors.surfaceDark : OneUIColors.surfaceLight);

    final highlightColor = widget.highlightColor ??
        (isDark ? OneUIColors.cardDark : Colors.grey[100]!);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                baseColor,
                highlightColor,
                baseColor,
              ],
              stops: [
                _controller.value - 0.3,
                _controller.value,
                _controller.value + 0.3,
              ].map((v) => v.clamp(0.0, 1.0)).toList(),
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}

/// Skeleton loader for list items
class OneUISkeletonLoader extends StatelessWidget {
  final double height;
  final double? width;
  final double borderRadius;

  const OneUISkeletonLoader({
    super.key,
    this.height = 16.0,
    this.width,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return OneUIShimmer(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isDark ? OneUIColors.surfaceDark : OneUIColors.surfaceLight,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}