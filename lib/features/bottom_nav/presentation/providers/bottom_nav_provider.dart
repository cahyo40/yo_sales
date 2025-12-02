import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_nav_provider.g.dart';

@riverpod
class BottomNavNotifier extends _$BottomNavNotifier {
  @override
  Future<int> build() async {
    // Initialize your async state here
    return 0;
  }

  bool isPage(int i) => state == AsyncValue.data(i);

  void changePageOwner(int i) {
    if (state == AsyncValue.data(i)) return;
    state = AsyncValue.data(i);
  }

  void changePageAdmin(int i) {
    if (state == AsyncValue.data(i)) return;
    state = AsyncValue.data(i);
  }

  void changePageCashier(int i) {
    if (state == AsyncValue.data(i)) return;
    state = AsyncValue.data(i);
  }
}
