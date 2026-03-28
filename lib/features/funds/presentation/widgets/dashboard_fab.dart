import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';

class DashboardFab extends StatelessWidget {
  const DashboardFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primary,
      onPressed: () {},
      child: const Icon(Icons.add_card),
    );
  }
}
