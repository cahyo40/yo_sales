import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

@riverpod
class ProductNotifier extends _$ProductNotifier {
  @override
  Future<void> build() async {
    // Initialize your async state here
    return;
  }
  
  // Add your business logic methods here
  Future<void> loadData() async {
    state = const AsyncLoading();
    try {
      // Your async operation here
      state = const AsyncData(null);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}

