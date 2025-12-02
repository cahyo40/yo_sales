import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yo_sales/core/assets/images/images_const.dart';
import 'package:yo_ui/yo_ui.dart';

class RegisterShopImageScreen extends ConsumerWidget {
  const RegisterShopImageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return YoImage.asset(assetPath: YoAssetsImage.register2, fit: BoxFit.cover);
  }
}
