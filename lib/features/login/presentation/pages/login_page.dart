import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yo_sales/features/login/presentation/pages/screens/login_form_screen.dart';
import 'package:yo_sales/features/login/presentation/pages/screens/login_image_screen.dart';
import 'package:yo_ui/yo_ui_base.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: YoResponsiveLayout(
          mobile: YoColumn(
            padding: YoPadding.vertical16,
            children: [
              Expanded(flex: 4, child: LoginImageScreen()),
              Expanded(flex: 6, child: LoginFormScreen()),
            ],
          ),
          tablet: context.yoIsPortrait
              ? YoColumn(
                  children: [
                    Expanded(flex: 4, child: LoginImageScreen()),
                    Expanded(flex: 6, child: LoginFormScreen()),
                  ],
                )
              : YoRow(
                  padding: YoPadding.all16,
                  children: [
                    Expanded(flex: 6, child: LoginImageScreen()),
                    Expanded(flex: 4, child: LoginFormScreen()),
                  ],
                ),
        ),
      ),
    );
  }
}
