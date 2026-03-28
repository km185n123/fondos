import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';

class HeroBalance extends StatelessWidget {
  const HeroBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Total portfolio balance",
          style: TextStyle(color: AppColors.secondary),
        ),
        SizedBox(height: 8),
        Text(
          "COP 500.000",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Icon(Icons.trending_up, size: 16, color: AppColors.primary),
            SizedBox(width: 4),
            Text("+2.4% this month"),
          ],
        ),
      ],
    );
  }
}
