import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yo_sales/features/register/presentation/pages/screens/register_user_form_screen.dart';
import 'package:yo_sales/features/register/presentation/pages/screens/register_user_image_screen.dart';
import 'package:yo_ui/yo_ui.dart';

class RegisterUserScreen extends HookConsumerWidget {
  final PageController pageController;
  const RegisterUserScreen({super.key, required this.pageController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: YoAppBar(
        title: "",
        variant: YoAppBarVariant.transparent,
        onBackPressed: () {
          context.pop();
        },
      ),
      body: YoResponsiveLayout(
        mobile: YoColumn(
          children: [
            Expanded(flex: 3, child: RegisterUserImageScreen()),
            Expanded(
              flex: 7,
              child: RegisterUserFormScreen(pageController: pageController),
            ),
          ],
        ),
      ),
    );
  }
}
