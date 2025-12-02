import 'package:freezed_annotation/freezed_annotation.dart';

part 'cashier_model.freezed.dart';
part 'cashier_model.g.dart';

@freezed
class CashierModel with _$CashierModel {
  const factory CashierModel({
    required String id,
    required String name,
    // Add your fields here
  }) = _CashierModel;

  factory CashierModel.fromJson(Map<String, dynamic> json) =>
      _$CashierModelFromJson(json);
}
