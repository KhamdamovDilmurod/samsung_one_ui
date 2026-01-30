import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/one_ui_colors.dart';
import '../constants/one_ui_dimensions.dart';
import '../constants/one_ui_typography.dart';

/// Samsung One UI TextField
///
/// Customizable text input field following One UI design guidelines
/// with 18dp corner radius and proper spacing
class OneUITextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextCapitalization textCapitalization;

  const OneUITextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onSubmitted,
    this.inputFormatters,
    this.focusNode,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  State<OneUITextField> createState() => _OneUITextFieldState();
}

class _OneUITextFieldState extends State<OneUITextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_handleFocusChange);
    }
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final fillColor = isDark
        ? OneUIColors.surfaceDark
        : OneUIColors.surfaceLight;

    final borderColor = widget.errorText != null
        ? (isDark ? OneUIColors.errorDark : OneUIColors.error)
        : _isFocused
        ? (isDark ? OneUIColors.primaryBlueDark : OneUIColors.primaryBlue)
        : (isDark ? OneUIColors.borderDark : OneUIColors.borderLight);

    final borderWidth = _isFocused || widget.errorText != null ? 2.0 : 1.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          autofocus: widget.autofocus,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          onSubmitted: widget.onSubmitted,
          inputFormatters: widget.inputFormatters,
          textCapitalization: widget.textCapitalization,
          style: OneUITypography.bodyLarge.copyWith(
            color: isDark
                ? OneUIColors.textPrimaryDark
                : OneUIColors.textPrimaryLight,
          ),
          decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            helperText: widget.helperText,
            errorText: widget.errorText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            filled: true,
            fillColor: fillColor,
            contentPadding: EdgeInsets.symmetric(
              horizontal: OneUISpacing.md,
              vertical: widget.maxLines != null && widget.maxLines! > 1
                  ? OneUISpacing.md
                  : OneUISpacing.md,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(OneUIRadius.input),
              borderSide: BorderSide(
                color: borderColor,
                width: borderWidth,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(OneUIRadius.input),
              borderSide: BorderSide(
                color: isDark ? OneUIColors.borderDark : OneUIColors.borderLight,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(OneUIRadius.input),
              borderSide: BorderSide(
                color: isDark
                    ? OneUIColors.primaryBlueDark
                    : OneUIColors.primaryBlue,
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(OneUIRadius.input),
              borderSide: BorderSide(
                color: isDark ? OneUIColors.errorDark : OneUIColors.error,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(OneUIRadius.input),
              borderSide: BorderSide(
                color: isDark ? OneUIColors.errorDark : OneUIColors.error,
                width: 2.0,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(OneUIRadius.input),
              borderSide: BorderSide(
                color: isDark
                    ? OneUIColors.buttonDisabledDark
                    : OneUIColors.buttonDisabledLight,
                width: 1.0,
              ),
            ),
            labelStyle: OneUITypography.bodyMedium.copyWith(
              color: _isFocused
                  ? (isDark
                  ? OneUIColors.primaryBlueDark
                  : OneUIColors.primaryBlue)
                  : (isDark
                  ? OneUIColors.textSecondaryDark
                  : OneUIColors.textSecondaryLight),
            ),
            hintStyle: OneUITypography.bodyMedium.copyWith(
              color: isDark
                  ? OneUIColors.textDisabledDark
                  : OneUIColors.textDisabledLight,
            ),
            helperStyle: OneUITypography.bodySmall.copyWith(
              color: isDark
                  ? OneUIColors.textSecondaryDark
                  : OneUIColors.textSecondaryLight,
            ),
            errorStyle: OneUITypography.bodySmall.copyWith(
              color: isDark ? OneUIColors.errorDark : OneUIColors.error,
            ),
            counterStyle: OneUITypography.bodySmall.copyWith(
              color: isDark
                  ? OneUIColors.textSecondaryDark
                  : OneUIColors.textSecondaryLight,
            ),
          ),
        ),
      ],
    );
  }
}

/// Password TextField with show/hide toggle
class OneUIPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool enabled;

  const OneUIPasswordField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
  });

  @override
  State<OneUIPasswordField> createState() => _OneUIPasswordFieldState();
}

class _OneUIPasswordFieldState extends State<OneUIPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return OneUITextField(
      controller: widget.controller,
      labelText: widget.labelText,
      hintText: widget.hintText,
      helperText: widget.helperText,
      errorText: widget.errorText,
      prefixIcon: widget.prefixIcon,
      obscureText: _obscureText,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    );
  }
}

/// Search TextField with clear button
class OneUISearchField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;

  const OneUISearchField({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
  });

  @override
  State<OneUISearchField> createState() => _OneUISearchFieldState();
}

class _OneUISearchFieldState extends State<OneUISearchField> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_handleTextChange);
    _hasText = _controller.text.isNotEmpty;
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_handleTextChange);
    }
    super.dispose();
  }

  void _handleTextChange() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
    });
  }

  void _handleClear() {
    _controller.clear();
    widget.onClear?.call();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    return OneUITextField(
      controller: _controller,
      hintText: widget.hintText ?? 'Search',
      prefixIcon: Icon(Icons.search),
      suffixIcon: _hasText
          ? IconButton(
        icon: Icon(Icons.clear),
        onPressed: _handleClear,
      )
          : null,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
    );
  }
}