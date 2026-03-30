import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/tokens/app_typography.dart';
import 'package:fondos/features/funds/presentation/bloc/fund_bloc.dart';
import 'package:fondos/features/funds/presentation/bloc/fund_state.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white.withValues(alpha: 0.9),
      elevation: 0,
      title: Row(
        children: [
          const Icon(Icons.account_balance_wallet, color: AppColors.primary),
          const SizedBox(width: 8),
          Text(
            'The Digital Mint',
            style: AppTypography.label.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Center(
            child: Text(
              '\$12,450.000',
              style: AppTypography.label.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
