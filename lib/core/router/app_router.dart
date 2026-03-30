import 'package:flutter/material.dart';
import 'package:fondos/core/router/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:fondos/features/funds/presentation/pages/dashboard_page.dart';
import 'package:fondos/features/history/presentation/pages/history_page.dart';
import 'package:fondos/features/transactions/presentation/pages/investments_page.dart';
import 'package:fondos/core/design_system/components/main_scaffold.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorDashboardKey = GlobalKey<NavigatorState>();
final _shellNavigatorInvestmentsKey = GlobalKey<NavigatorState>();
final _shellNavigatorHistoryKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: homeRoute,
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
              path: homeRoute,
              builder: (context, state) => const DashboardPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorInvestmentsKey,
          routes: [
            GoRoute(
              path: investmentsRoute,
              builder: (context, state) => const InvestmentsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHistoryKey,
          routes: [
            GoRoute(
              path: historyRoute,
              builder: (context, state) => const HistoryPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
