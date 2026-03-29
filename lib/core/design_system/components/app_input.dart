import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_radius.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/core/design_system/tokens/app_typography.dart';

class AppInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String? error;
  final Function(String) onChanged;
  final Widget? trailing;
  /// Optional prefix symbol shown inside the field (e.g. '\$').
  /// It lives in InputDecoration so it never becomes part of the text value.
  final String? prefixSymbol;

  const AppInput({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.onChanged,
    this.error,
    this.trailing,
    this.prefixSymbol,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.label),
        const SizedBox(height: AppSpacing.xs),
        TextField(
          controller: controller,
          onChanged: onChanged,
          keyboardType: TextInputType.number,
          style: AppTypography.headlineMedium,
          decoration: InputDecoration(
            hintText: hint,
            errorText: error,
            filled: true,
            fillColor: AppColors.surfaceHigh,
            // $ is a static prefix — never moves with the cursor.
            prefixText: prefixSymbol != null ? '$prefixSymbol ' : null,
            prefixStyle: AppTypography.headlineMedium,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
          ),
        ),
        if (trailing != null) ...[
          const SizedBox(height: AppSpacing.xs),
          trailing!,
        ],
      ],
    );
  }
}
