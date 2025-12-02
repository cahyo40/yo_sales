import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yo_sales/features/register/presentation/pages/screens/register_shop_screen.dart';
import 'package:yo_sales/features/register/presentation/pages/screens/register_success_screen.dart';
import 'package:yo_sales/features/register/presentation/pages/screens/register_user_screen.dart';
import 'package:yo_ui/yo_ui_base.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController();
    final currentPage = useState(1);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            YoProgress.linear(
              color: context.primaryColor,
              value: currentPage.value / 3,
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  currentPage.value = index + 1;
                },
                children: [
                  RegisterUserScreen(pageController: pageController),
                  RegisterShopScreen(pageController: pageController),
                  RegisterSuccessScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
