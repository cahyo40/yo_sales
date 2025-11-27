import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yo_sales/features/onboarding/presentation/pages/screens/onboarding_screen.dart';
import 'package:yo_ui/yo_ui.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // appBar: AppBar(title: Text('Onboarding'), centerTitle: true),
      body: SafeArea(
        child: YoResponsiveLayout(
          mobile: OnboardingScreen(),
          tablet: OnboardingScreen(),
        ),
      ),
    );
  }
}
