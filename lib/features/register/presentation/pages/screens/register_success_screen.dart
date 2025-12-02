import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yo_sales/core/assets/images/images_const.dart';
import 'package:yo_sales/l10n/app_localizations.dart';
import 'package:yo_ui/yo_ui.dart';

class RegisterSuccessScreen extends ConsumerWidget {
  const RegisterSuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return YoEmptyState(
      title: l10n.register_success_title,
      description: l10n.register_success_desc,
      onAction: () {},
      actionText: l10n.get_started,
      icon: YoImage.asset(
        assetPath: YoAssetsImage.registerSuccess,
        shape: BoxShape.circle,
      ),
    );
  }
}
