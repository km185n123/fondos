import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_typography.dart';

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
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.show_chart),
          label: 'Investments',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
      ],
    );
  }
}
