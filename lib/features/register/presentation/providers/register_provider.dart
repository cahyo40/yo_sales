import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yo_sales/features/register/domain/models/register_model.dart';

part 'register_provider.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  @override
  RegisterModel build() => RegisterModel.initial();

  /// 1 fungsi update semua field sekaligus
  void updateData({
    String? name,
    String? email,
    String? password,
    String? phone,
    String? shopName,
    String? shopAddress,
    String? shopPhone,
    String? shopDescription,
    String? shopCategory,
  }) {
    state = state.copyWith(
      name: name ?? state.name,
      email: email ?? state.email,
      password: password ?? state.password,
      phone: phone ?? state.phone,
      shopName: shopName ?? state.shopName,
      shopAddress: shopAddress ?? state.shopAddress,
      shopPhone: shopPhone ?? state.shopPhone,
      shopDescription: shopDescription ?? state.shopDescription,
      shopCategory: shopCategory ?? state.shopCategory,
    );
  }
}
