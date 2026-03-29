import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fondos/features/funds/domain/entities/fund.dart';
import 'package:fondos/features/funds/presentation/pages/dashboard_page.dart';
import 'package:fondos/features/transactions/presentation/pages/subscription_page.dart';
import 'package:fondos/features/history/presentation/pages/history_page.dart';
import 'package:fondos/features/transactions/presentation/pages/investments_page.dart';
import 'package:fondos/core/design_system/components/main_scaffold.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorDashboardKey = GlobalKey<NavigatorState>();
final _shellNavigatorInvestmentsKey = GlobalKey<NavigatorState>();
final _shellNavigatorHistoryKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScaffold(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDashboardKey,
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const DashboardPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorInvestmentsKey,
          routes: [
            GoRoute(
              path: '/investments',
              builder: (context, state) => const InvestmentsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHistoryKey,
          routes: [
            GoRoute(
              path: '/history',
              builder: (context, state) => const HistoryPage(),
            ),
          ],
        ),
      ],
    ),
    // Pushed routes (outside shell)
    GoRoute(
      path: '/subscription',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final fund = state.extra as Fund;
        return SubscriptionPage(fund: fund);
      },
    ),
  ],
);
