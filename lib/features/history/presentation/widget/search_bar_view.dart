import 'package:flutter/material.dart';
import 'package:fondos/l10n/app_localizations.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_radius.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';

class SearchBarView extends StatelessWidget {
  const SearchBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceLow,
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: const Icon(Icons.search, color: AppColors.textSecondary),
          hintText: AppLocalizations.of(context)!.search,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
