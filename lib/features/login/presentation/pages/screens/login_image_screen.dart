import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yo_sales/core/assets/images/images_const.dart';
import 'package:yo_ui/yo_ui_base.dart';

class LoginImageScreen extends ConsumerWidget {
  const LoginImageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return YoImage.asset(assetPath: YoAssetsImage.login, fit: BoxFit.cover);
  }
}
