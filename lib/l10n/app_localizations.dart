import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

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
    Locale('id'),
  ];

  /// No description provided for @onboard_title_1.
  ///
  /// In en, this message translates to:
  /// **'Store Management Made Simple'**
  String get onboard_title_1;

  /// No description provided for @onboard_title_2.
  ///
  /// In en, this message translates to:
  /// **'Manage Multiple Branches at Once'**
  String get onboard_title_2;

  /// No description provided for @onboard_title_3.
  ///
  /// In en, this message translates to:
  /// **'Faster Transactions, Smoother Sales'**
  String get onboard_title_3;

  /// No description provided for @onboard_desc_1.
  ///
  /// In en, this message translates to:
  /// **'A modern cashier app for SMEs with a minimal look and fast flow. Perfect for tablets & smartphones.'**
  String get onboard_desc_1;

  /// No description provided for @onboard_desc_2.
  ///
  /// In en, this message translates to:
  /// **'Handle several outlets in one account, monitor stock and transactions for every branch in real time.'**
  String get onboard_desc_2;

  /// No description provided for @onboard_desc_3.
  ///
  /// In en, this message translates to:
  /// **'Instant selling process through a concise, responsive, and easy-to-use cashier screen.'**
  String get onboard_desc_3;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @get_started.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get get_started;

  /// No description provided for @login_title.
  ///
  /// In en, this message translates to:
  /// **'Sign in to YoSale'**
  String get login_title;

  /// No description provided for @login_body.
  ///
  /// In en, this message translates to:
  /// **'Manage all your outlets in one place. Sign in to start handling products, transactions and sales reports.'**
  String get login_body;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forget_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forget_password;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @register_now.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get register_now;

  /// No description provided for @snackbar_login_e.
  ///
  /// In en, this message translates to:
  /// **'Login failed. Please check your email and password.'**
  String get snackbar_login_e;

  /// No description provided for @snackbar_login_s.
  ///
  /// In en, this message translates to:
  /// **'Login successful. Welcome back!'**
  String get snackbar_login_s;

  /// No description provided for @btn_login.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get btn_login;

  /// No description provided for @btn_register.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get btn_register;

  /// No description provided for @btn_send_email.
  ///
  /// In en, this message translates to:
  /// **'Send Email'**
  String get btn_send_email;
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
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
