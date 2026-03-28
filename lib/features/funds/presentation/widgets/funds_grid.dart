import 'package:flutter/material.dart';
import 'package:fondos/core/design_system/tokens/app_colors.dart';
import 'package:fondos/core/design_system/layout/responsive.dart';
import 'package:fondos/core/design_system/tokens/app_typography.dart';
import 'package:fondos/features/funds/presentation/widgets/fund_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fondos/features/funds/presentation/bloc/fund_bloc.dart';
import 'package:fondos/features/funds/presentation/bloc/fund_state.dart';

class FundsGrid extends StatelessWidget {
  const FundsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final int cols = Responsive.columns(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Available Investment Funds',
              style: AppTypography.headlineMedium.copyWith(
                fontSize: 18,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              'See analytics',
              style: AppTypography.label.copyWith(
                color: AppColors.primaryContainer,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        BlocBuilder<FundBloc, FundState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (msg) => Center(child: Text(msg)),
              success: (funds, _) => GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: funds.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 160,
                ),
                itemBuilder: (_, i) => FundCard(funds[i]),
              ),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ],
    );
  }
}
