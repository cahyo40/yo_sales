import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yo_sales/features/register/presentation/pages/screens/register_shop_form_screen.dart';
import 'package:yo_sales/features/register/presentation/pages/screens/register_shop_image_screen.dart';
import 'package:yo_ui/yo_ui.dart';

class RegisterShopScreen extends ConsumerWidget {
  final PageController pageController;
  const RegisterShopScreen({super.key, required this.pageController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: YoAppBar(
        title: "",
        variant: YoAppBarVariant.transparent,
        onBackPressed: () {
          pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
      body: YoResponsiveLayout(
        mobile: YoColumn(
          children: [
            Expanded(flex: 3, child: RegisterShopImageScreen()),
            Expanded(
              flex: 7,
              child: RegisterShopFormScreen(pageController: pageController),
            ),
          ],
        ),
      ),
    );
  }
}
