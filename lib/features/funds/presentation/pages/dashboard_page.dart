import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/core/design_system/components/app_fab.dart';
import 'package:fondos/features/funds/presentation/bloc/config_cubit.dart';
import 'package:fondos/features/funds/presentation/widgets/funds_grid_view.dart';
import 'package:fondos/features/funds/presentation/widgets/hero_balance_view.dart';
import 'package:fondos/features/funds/presentation/widgets/old_security_banner_view.dart';
import 'package:fondos/features/funds/presentation/widgets/security_banner_view.dart';
import 'package:fondos/features/funds/presentation/widgets/top_bar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final useNewSecurityBanner = context.select(
      (ConfigCubit cubit) => cubit.state,
    );
    return Scaffold(
      appBar: const TopBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeroBalanceView(),
            const SizedBox(height: AppSpacing.lg),
            const FundsGridView(),
            const SizedBox(height: AppSpacing.xl),
            useNewSecurityBanner
                ? const SecurityBannerView()
                : const OldSecurityBannerView(),
          ],
        ),
      ),
      floatingActionButton: AppFab(onPressed: () {}, icon: Icons.add_card),
    );
  }
}
