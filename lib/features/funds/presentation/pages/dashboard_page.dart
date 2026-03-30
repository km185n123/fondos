import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/core/design_system/components/app_fab.dart';
import 'package:fondos/features/funds/presentation/widgets/funds_grid_view.dart';
import 'package:fondos/features/funds/presentation/widgets/hero_balance_view.dart';
import 'package:fondos/features/funds/presentation/widgets/security_banner_view.dart';
import 'package:fondos/features/funds/presentation/widgets/top_bar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroBalanceView(),
            SizedBox(height: AppSpacing.lg),
            FundsGridView(),
            SizedBox(height: AppSpacing.xl),
            SecurityBannerView(),
          ],
        ),
      ),
      floatingActionButton: AppFab(onPressed: () {}, icon: Icons.add_card),
    );
  }
}
