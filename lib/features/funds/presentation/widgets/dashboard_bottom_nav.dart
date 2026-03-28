import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_typography.dart';

class DashboardBottomNav extends StatelessWidget {
  const DashboardBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
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
<<<<<<< Updated upstream
          label: 'Investments',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
=======
          label: 'Inversiones',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Historial'),
>>>>>>> Stashed changes
      ],
    );
  }
}
