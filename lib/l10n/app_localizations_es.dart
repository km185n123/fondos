// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get transactions => 'Transacciones';

  @override
  String get confirm_cancellation => '¿Confirmar cancelación?';

  @override
  String get cancellation_warning => 'El proceso puede tardar 48h';

  @override
  String get yes_cancel => 'Sí, cancelar';

  @override
  String get keep_investment => 'Mantener inversión';

  @override
  String get invested => 'Invertido';

  @override
  String get details => 'Detalles';

  @override
  String get cancel => 'Cancelar';

  @override
  String get no_investments => 'No tienes inversiones activas';

  @override
  String get subscription_success => 'Suscripción exitosa';

  @override
  String get notification_method => 'Método de notificación';

  @override
  String get selected_fund => 'Fondo seleccionado';

  @override
  String get security_center => 'Centro de Seguridad';

  @override
  String get completed => 'COMPLETADO';

  @override
  String min_amount_error(String amount) {
    return 'Monto inferior al mínimo de $amount';
  }

  @override
  String get balance => 'Balance';

  @override
  String get search => 'Buscar...';

  @override
  String get invest => 'Invertir';

  @override
  String category(Object category) {
    return 'Categoría: $category';
  }

  @override
  String min_amount(Object amount) {
    return 'Monto mínimo: $amount';
  }

  @override
  String get minimum_investment => 'Inversión mínima';

  @override
  String get total_portfolio => 'Balance total del portafolio';

  @override
  String monthly_growth(String percent) {
    return '+$percent% este mes';
  }

  @override
  String get wealth_protected => 'Su riqueza, meticulosamente protegida.';

  @override
  String get amount_to_invest => 'Monto a invertir';

  @override
  String available(Object amount) {
    return 'Disponible: $amount';
  }

  @override
  String get processing => 'Procesando...';

  @override
  String get subscribe => 'Suscribirse';

  @override
  String get insufficient_balance => 'Saldo insuficiente';

  @override
  String get select_fund_error => 'Por favor selecciona un fondo';

  @override
  String get notification_method_error => 'Debe elegir email o SMS';

  @override
  String get error => 'Error';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get investments => 'Inversiones';

  @override
  String get history => 'Historial';

  @override
  String get the_digital_mint => 'La Moneda Digital';

  @override
  String get total_portfolio_balance => '\$12,450.000';

  @override
  String get no_transactions => 'No hay transacciones registradas';

  @override
  String get no_transactions_description =>
      'Tus movimientos financieros aparecerán aquí.';

  @override
  String get email => 'Email';

  @override
  String get sms => 'SMS';
}
