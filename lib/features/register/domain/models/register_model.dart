import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_model.freezed.dart';
part 'register_model.g.dart';

@freezed
class RegisterModel with _$RegisterModel {
  const factory RegisterModel({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String shopName,
    required String shopAddress,
    required String shopPhone,
    required String shopDescription,
    required String shopCategory,

    // Add your fields here
  }) = _RegisterModel;

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  factory RegisterModel.initial() => RegisterModel(
    name: '',
    email: '',
    password: '',
    phone: '',
    shopName: '',
    shopAddress: '',
    shopPhone: '',
    shopDescription: '',
    shopCategory: '',
  );
}
