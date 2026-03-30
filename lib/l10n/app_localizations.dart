import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactions;

  /// No description provided for @confirm_cancellation.
  ///
  /// In en, this message translates to:
  /// **'Confirm cancellation?'**
  String get confirm_cancellation;

  /// No description provided for @cancellation_warning.
  ///
  /// In en, this message translates to:
  /// **'The process may take up to 48 hours'**
  String get cancellation_warning;

  /// No description provided for @yes_cancel.
  ///
  /// In en, this message translates to:
  /// **'Yes, cancel'**
  String get yes_cancel;

  /// No description provided for @keep_investment.
  ///
  /// In en, this message translates to:
  /// **'Keep investment'**
  String get keep_investment;

  /// No description provided for @invested.
  ///
  /// In en, this message translates to:
  /// **'Invested'**
  String get invested;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @no_investments.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have active investments'**
  String get no_investments;

  /// No description provided for @subscription_success.
  ///
  /// In en, this message translates to:
  /// **'Subscription successful'**
  String get subscription_success;

  /// No description provided for @notification_method.
  ///
  /// In en, this message translates to:
  /// **'Notification method'**
  String get notification_method;

  /// No description provided for @selected_fund.
  ///
  /// In en, this message translates to:
  /// **'Selected fund'**
  String get selected_fund;

  /// No description provided for @security_center.
  ///
  /// In en, this message translates to:
  /// **'Security Center'**
  String get security_center;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'COMPLETED'**
  String get completed;

  /// No description provided for @min_amount_error.
  ///
  /// In en, this message translates to:
  /// **'Amount is below the minimum of {amount}'**
  String min_amount_error(String amount);

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get search;

  /// No description provided for @invest.
  ///
  /// In en, this message translates to:
  /// **'Invest'**
  String get invest;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category: {category}'**
  String category(Object category);

  /// No description provided for @min_amount.
  ///
  /// In en, this message translates to:
  /// **'Minimum amount: {amount}'**
  String min_amount(Object amount);

  /// No description provided for @minimum_investment.
  ///
  /// In en, this message translates to:
  /// **'Minimum Investment'**
  String get minimum_investment;

  /// No description provided for @total_portfolio.
  ///
  /// In en, this message translates to:
  /// **'Total portfolio balance'**
  String get total_portfolio;

  /// No description provided for @monthly_growth.
  ///
  /// In en, this message translates to:
  /// **'+{percent}% this month'**
  String monthly_growth(String percent);

  /// No description provided for @wealth_protected.
  ///
  /// In en, this message translates to:
  /// **'Your wealth, meticulously protected.'**
  String get wealth_protected;

  /// No description provided for @amount_to_invest.
  ///
  /// In en, this message translates to:
  /// **'Amount to invest'**
  String get amount_to_invest;

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available: {amount}'**
  String available(Object amount);

  /// No description provided for @processing.
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get processing;

  /// No description provided for @subscribe.
  ///
  /// In en, this message translates to:
  /// **'Subscribe'**
  String get subscribe;

  /// No description provided for @insufficient_balance.
  ///
  /// In en, this message translates to:
  /// **'Insufficient balance'**
  String get insufficient_balance;

  /// No description provided for @select_fund_error.
  ///
  /// In en, this message translates to:
  /// **'Please select a fund'**
  String get select_fund_error;

  /// No description provided for @notification_method_error.
  ///
  /// In en, this message translates to:
  /// **'You must choose email or SMS'**
  String get notification_method_error;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
