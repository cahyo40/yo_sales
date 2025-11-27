import 'package:flutter/material.dart';
import 'package:yo_sales/l10n/app_localizations.dart';

class L10n {
  L10n._();
  static AppLocalizations t(BuildContext context) {
    return AppLocalizations.of(context)!;
  }
}
