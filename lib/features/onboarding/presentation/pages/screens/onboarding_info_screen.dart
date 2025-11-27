import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yo_sales/core/language/l10n.dart';
import 'package:yo_sales/core/navigation/route_paths.dart';
import 'package:yo_sales/features/onboarding/domain/models/onboarding_model.dart';
import 'package:yo_sales/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:yo_ui/yo_ui.dart';

class OnboardingInfoScreen extends StatelessWidget {
  const OnboardingInfoScreen({
    super.key,
    required this.provider,
    required this.pageLength,
    required this.pageController,
    required this.flex,
    required this.providerNotifier,
  });

  final AsyncValue<int> provider;
  final int pageLength;
  final int flex;
  final PageController pageController;
  final OnboardingNotifier providerNotifier;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: YoColumn(
        mainAxisAlignment: .spaceBetween,
        padding: YoPadding.all20,
        children: [
          YoSpace.heightMd(),
          Column(
            spacing: context.yoSpacingSm.scaled(context),
            children: [
              YoText.headlineLarge(
                OnboardingModel.values(context)[provider.value!].title,
                align: TextAlign.center,
                fontWeight: FontWeight.bold,
              ),
              YoText.bodyMedium(
                OnboardingModel.values(context)[provider.value!].description,
                align: TextAlign.center,
              ),
            ],
          ),

          Row(
            children: [
              Expanded(
                child: Row(
                  spacing: context.yoSpacingSm.scaled(context),
                  children: List.generate(pageLength, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 10,
                      width: provider.value == index ? 40 : 10,
                      decoration: BoxDecoration(
                        color: provider.value != index
                            ? context.primaryColor.withOpacity(.3)
                            : context.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  }),
                ),
              ),
              YoButton.primary(
                textColor: context.onPrimaryColor,
                text: provider.value! < pageLength - 1
                    ? L10n.t(context).next
                    : L10n.t(context).get_started,
                onPressed: () {
                  pageController.animateToPage(
                    provider.value! < 2 ? provider.value! + 1 : 2,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                  providerNotifier.onNextPage();
                  if (provider.value! == pageLength - 1) {
                    context.push(RoutePaths.HOME);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
