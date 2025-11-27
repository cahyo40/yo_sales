import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yo_sales/features/onboarding/domain/models/onboarding_model.dart';
import 'package:yo_sales/features/onboarding/presentation/pages/screens/onboarding_image_screen.dart';
import 'package:yo_sales/features/onboarding/presentation/pages/screens/onboarding_info_screen.dart';
import 'package:yo_sales/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:yo_ui/yo_ui.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController();
    final provider = ref.watch(onboardingNotifierProvider);
    final providerNotifier = ref.read(onboardingNotifierProvider.notifier);
    final pageLength = OnboardingModel.values(context).length;
    return provider.when(
      data: (data) {
        return context.yoIsPortrait
            ? YoColumn(
                padding: YoPadding.all20,
                children: [
                  OnboardingImageScreen(
                    flex: 7,
                    pageController: pageController,
                    pageLength: pageLength,
                    providerNotifier: providerNotifier,
                  ),
                  OnboardingInfoScreen(
                    flex: 3,
                    provider: provider,
                    pageLength: pageLength,
                    pageController: pageController,
                    providerNotifier: providerNotifier,
                  ),
                ],
              )
            : YoRow(
                children: [
                  OnboardingImageScreen(
                    flex: 6,
                    pageController: pageController,
                    pageLength: pageLength,
                    providerNotifier: providerNotifier,
                  ),
                  OnboardingInfoScreen(
                    flex: 4,
                    provider: provider,
                    pageLength: pageLength,
                    pageController: pageController,
                    providerNotifier: providerNotifier,
                  ),
                ],
              );
      },
      error: (error, s) {
        return YoEmptyState.error(title: "Error", description: "$error -> $s");
      },
      loading: () {
        return const YoLoading();
      },
    );
  }
}
