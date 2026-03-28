import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/core/di/injection.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/features/funds/presentation/bloc/fund_bloc.dart';
import 'package:fondos/features/funds/presentation/bloc/fund_event.dart';
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
    return Scaffold(
      appBar: const TopBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeroBalance(),
            const SizedBox(height: 32),
            BlocProvider(
              create: (_) => getIt<FundBloc>()..add(const FundEvent.getFunds()),
              child: const FundsGrid(),
            ),
            const SizedBox(height: 40),
            const SecurityBanner(),
          ],
        ),
      ),
      bottomNavigationBar: const DashboardBottomNav(),
      floatingActionButton: const DashboardFab(),
    );
  }
}
