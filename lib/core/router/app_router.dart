import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/features/funds/presentation/pages/dashboard_page.dart';
import 'package:fondos/features/transactions/presentation/pages/subscription_page.dart.dart';

class BottomSheetPage<T> extends Page<T> {
  final Widget child;

  const BottomSheetPage({required this.child, super.key, super.name});

  @override
  Route<T> createRoute(BuildContext context) {
    return ModalBottomSheetRoute<T>(
      settings: this,
      builder: (context) => child,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useSafeArea: true,
    );
  }
}

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DashboardPage(),
      routes: [
        GoRoute(
          path: 'subscription',
          pageBuilder: (context, state) {
            final fund = state.extra as Fund;
            return BottomSheetPage(
              key: state.pageKey,
              child: SubscriptionPage(fund: fund),
            );
          },
        ),
      ],
    ),
  ],
);
