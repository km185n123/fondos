import 'package:flutter/material.dart';
import 'package:fondos/core/enum/notification_method.dart';
import 'package:fondos/l10n/app_localizations.dart';
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
        Text(
          AppLocalizations.of(context)!.notification_method,
          style: AppTypography.label,
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Expanded(
              child: AppRadioCard(
                label: AppLocalizations.of(context)!.email,
                selected: selected == NotificationMethod.email,
                onTap: () => onChanged(NotificationMethod.email),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: AppRadioCard(
                label: AppLocalizations.of(context)!.sms,
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
