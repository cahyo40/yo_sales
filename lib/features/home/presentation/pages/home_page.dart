import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yo_ui/yo_ui.dart';

import '../providers/home_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(homeNotifierProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: YoText.titleLarge('Home', color: context.onPrimaryColor),
            centerTitle: true,
            backgroundColor: context.primaryColor,
            floating: true,
          ),
          SliverFillRemaining(
            child: asyncState.when(
              data: (data) => Center(
                child: Column(
                  children: [
                    YoText.bodyMedium('HomePage is working'),
                    YoButton.primary(
                      text: 'Next',
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ],
                ),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            ),
          ),
        ],
      ),
    );
  }
}
