// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get transactions => 'Transactions';

  @override
  String get confirm_cancellation => 'Confirm cancellation?';

  @override
  String get cancellation_warning => 'The process may take up to 48 hours';

  @override
  String get yes_cancel => 'Yes, cancel';

  @override
  String get keep_investment => 'Keep investment';

  @override
  String get invested => 'Invested';

  @override
  String get details => 'Details';

  @override
  String get cancel => 'Cancel';

  @override
  String get no_investments => 'You don\'t have active investments';

  @override
  String get subscription_success => 'Subscription successful';

  @override
  String get notification_method => 'Notification method';

  @override
  String get selected_fund => 'Selected fund';

  @override
  String get security_center => 'Security Center';

  @override
  String get completed => 'COMPLETED';

  @override
  String min_amount_error(String amount) {
    return 'Amount is below the minimum of $amount';
  }

  @override
  String get balance => 'Balance';

  @override
  String get search => 'Search...';

  @override
  String get invest => 'Invest';

  @override
  String category(Object category) {
    return 'Category: $category';
  }

  @override
  String min_amount(Object amount) {
    return 'Minimum amount: $amount';
  }

  @override
  String get minimum_investment => 'Minimum Investment';

  @override
  String get total_portfolio => 'Total portfolio balance';

  @override
  String monthly_growth(String percent) {
    return '+$percent% this month';
  }

  @override
  String get wealth_protected => 'Your wealth, meticulously protected.';

  @override
  String get amount_to_invest => 'Amount to invest';

  @override
  String available(Object amount) {
    return 'Available: $amount';
  }

  @override
  String get processing => 'Processing...';

  @override
  String get subscribe => 'Subscribe';

  @override
  String get insufficient_balance => 'Insufficient balance';

  @override
  String get select_fund_error => 'Please select a fund';

  @override
  String get notification_method_error => 'You must choose email or SMS';

  @override
  String get error => 'Error';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get investments => 'Investments';

  @override
  String get history => 'History';

  @override
  String get the_digital_mint => 'The Digital Mint';

  @override
  String get total_portfolio_balance => '\$12,450.000';

  @override
  String get no_transactions => 'No transactions recorded';

  @override
  String get no_transactions_description =>
      'Your financial movements will appear here.';

  @override
  String get email => 'Email';

  @override
  String get sms => 'SMS';
}
