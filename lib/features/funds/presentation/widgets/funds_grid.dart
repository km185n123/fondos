import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/components/app_card.dart';
import 'package:fondos/core/design_system/components/app_chip.dart';

class FundsGrid extends StatelessWidget {
  const FundsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final funds = [
      Fund("F001", "Vanguard Alpha", "Equity", "50.000"),
      Fund("F002", "Brick & Mortar", "Real Estate", "150.000"),
      Fund("F003", "Green Tech ETF", "Sustainable", "25.000"),
      Fund("F004", "Treasury Shield", "Fixed Income", "10.000"),
      Fund("F005", "Global Emerging", "International", "100.000"),
    ];

    return LayoutBuilder(
      builder: (_, constraints) {
        int cols = 1;
        if (constraints.maxWidth > 900)
          cols = 3;
        else if (constraints.maxWidth > 600)
          cols = 2;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Available Investment Funds",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: funds.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cols,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.3,
              ),
              itemBuilder: (_, i) => FundCard(funds[i]),
            ),
          ],
        );
      },
    );
  }
}

class Fund {
  final String id, name, type, min;
  const Fund(this.id, this.name, this.type, this.min);
}

class FundCard extends StatelessWidget {
  final Fund fund;

  const FundCard(this.fund, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fund.id,
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    Text(
                      fund.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              AppChip(label: fund.type),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("COP ${fund.min}"),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.white),
                style: IconButton.styleFrom(backgroundColor: AppColors.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
