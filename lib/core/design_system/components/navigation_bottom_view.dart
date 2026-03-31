import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_typography.dart';
import 'package:fondos/l10n/app_localizations.dart';

class NavigationBottomView extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const NavigationBottomView({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedLabelStyle: AppTypography.label.copyWith(
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: AppTypography.label,
      selectedItemColor: AppColors.primary,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.dashboard),
          label: AppLocalizations.of(context)!.dashboard,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.show_chart),
          label: AppLocalizations.of(context)!.investments,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.history),
          label: AppLocalizations.of(context)!.history,
        ),
      ],
    );
  }
}
