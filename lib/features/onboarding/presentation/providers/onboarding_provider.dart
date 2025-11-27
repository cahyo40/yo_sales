import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_provider.g.dart';

@riverpod
class OnboardingNotifier extends _$OnboardingNotifier {
  @override
  Future<int> build() async {
    // Initialize your async state here
    return 0;
  }

  // Add your business logic methods here
  void changePage(int index) {
    state = AsyncData(index);
  }

  void onNextPage() {
    if (state.value! < 2) {
      state = AsyncData(state.value! + 1);
    }
  }
}
