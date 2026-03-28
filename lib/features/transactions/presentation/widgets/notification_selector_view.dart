import 'package:flutter/widgets.dart';
import 'package:fondos/core/design_system/tokens/app_spacing.dart';
import 'package:fondos/core/design_system/tokens/app_typography.dart';
import 'package:fondos/features/transactions/domain/entitie/transaction.dart';
import 'package:fondos/core/design_system/components/app_radio_card.dart';

class NotificationSelectorView extends StatelessWidget {
  final NotificationMethod selected;
  final ValueChanged<NotificationMethod> onChanged;

  const NotificationSelectorView({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Método de notificación', style: AppTypography.label),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Expanded(
              child: AppRadioCard(
                label: 'Email',
                selected: selected == NotificationMethod.email,
                onTap: () => onChanged(NotificationMethod.email),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: AppRadioCard(
                label: 'SMS',
                selected: selected == NotificationMethod.sms,
                onTap: () => onChanged(NotificationMethod.sms),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
