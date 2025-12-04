import 'package:flutter/material.dart';
import 'package:yo_sales/l10n/app_localizations.dart';

enum Role { owner, admin, cashier }

extension RoleExtension on Role {
  String name(BuildContext context) {
    switch (this) {
      case Role.owner:
        return AppLocalizations.of(context)!.owner;
      case Role.admin:
        return AppLocalizations.of(context)!.admin;
      case Role.cashier:
        return AppLocalizations.of(context)!.cashier;
    }
  }
}
