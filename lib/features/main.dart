// lib/main.dart
import 'package:flutter/material.dart';
import 'package:fondos/core/di/injection.dart';
import 'package:fondos/core/design_system/theme/app_theme.dart';
import 'package:fondos/features/funds/presentation/pages/dashboard_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // needed for DI
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Digital Mint',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {'/': (_) => const DashboardScreen()},
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
    );
  }
}
