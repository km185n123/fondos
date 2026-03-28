import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/features/funds/presentation/widgets/dashboard_bottom_nav.dart';
import 'package:fondos/features/funds/presentation/widgets/dashboard_fab.dart';
import 'package:fondos/features/funds/presentation/widgets/funds_grid.dart';
import 'package:fondos/features/funds/presentation/widgets/hero_balance.dart';
import 'package:fondos/features/funds/presentation/widgets/security_banner.dart';
import 'package:fondos/features/funds/presentation/widgets/top_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroBalance(),
            SizedBox(height: 32),
            FundsGrid(),
            SizedBox(height: 40),
            SecurityBanner(),
          ],
        ),
      ),
      bottomNavigationBar: DashboardBottomNav(),
      floatingActionButton: DashboardFab(),
    );
  }
}
