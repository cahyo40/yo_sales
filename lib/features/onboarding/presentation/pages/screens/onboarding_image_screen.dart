import 'package:flutter/material.dart';
import 'package:yo_sales/features/onboarding/domain/models/onboarding_model.dart';
import 'package:yo_sales/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:yo_ui/yo_ui.dart';

class OnboardingImageScreen extends StatelessWidget {
  const OnboardingImageScreen({
    super.key,
    required this.pageController,
    required this.pageLength,
    required this.flex,
    required this.providerNotifier,
  });
  final int flex;
  final PageController pageController;
  final int pageLength;
  final OnboardingNotifier providerNotifier;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        itemCount: pageLength,
        onPageChanged: (index) {
          providerNotifier.changePage(index);
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        itemBuilder: (context, index) {
          return YoImage.asset(
            assetPath: OnboardingModel.values(context)[index].image,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
