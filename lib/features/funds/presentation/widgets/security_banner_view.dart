import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_radius.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/core/design_system/tokens/app_typography.dart';
import 'package:fondos/l10n/app_localizations.dart';

class SecurityBannerView extends StatelessWidget {
  const SecurityBannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.surfaceLow,
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: Row(
        children: [
          const Icon(Icons.shield, size: 40, color: AppColors.primary),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.wealth_protected,
              style: AppTypography.label.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(AppLocalizations.of(context)!.security_center),
          ),
        ],
      ),
    );
  }
}
