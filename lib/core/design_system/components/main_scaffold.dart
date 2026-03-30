import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:fondos/core/design_system/components/navigation_bottom_view.dart';
import 'package:fondos/features/funds/presentation/bloc/fund_bloc.dart';
import 'package:fondos/features/funds/presentation/bloc/fund_event.dart';
import 'package:fondos/features/transactions/presentation/bloc/investments_bloc.dart';
import 'package:fondos/core/di/injection.dart';

class MainScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScaffold({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<FundBloc>()..add(const FundEvent.getFunds()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => getIt<InvestmentsBloc>(),
        ),
      ],
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBottomView(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
        ),
      ),
    );
  }
}
