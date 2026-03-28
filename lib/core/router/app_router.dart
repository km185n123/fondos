import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fondos/features/funds/presentation/pages/dashboard_screen.dart';
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
      builder: (context, state) => const DashboardScreen(),
      routes: [
        GoRoute(
          path: 'subscription',
          pageBuilder: (context, state) => BottomSheetPage(
            key: state.pageKey,
            child: const SubscriptionPage(),
          ),
        ),
      ],
    ),
  ],
);
