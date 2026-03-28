import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white.withOpacity(0.9),
      elevation: 0,
      title: const Row(
        children: [
          Icon(Icons.account_balance_wallet, color: AppColors.primary),
          SizedBox(width: 8),
          Text(
            "The Digital Mint",
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Center(
            child: Text(
              "\$12,450.00",
              style: TextStyle(color: AppColors.textPrimary),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
