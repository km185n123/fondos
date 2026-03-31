import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_radius.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/core/design_system/tokens/app_typography.dart';
import 'package:fondos/l10n/app_localizations.dart';

class OldSecurityBannerView extends StatelessWidget {
  final VoidCallback? onPressed;

  const OldSecurityBannerView({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surfaceLow,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: AppColors.primary),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              l10n.wealth_protected,
              style: AppTypography.body.copyWith(color: AppColors.textPrimary),
            ),
          ),
        ],
      ),
    );
  }
}
