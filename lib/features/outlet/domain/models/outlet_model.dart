import 'package:freezed_annotation/freezed_annotation.dart';

part 'outlet_model.freezed.dart';
part 'outlet_model.g.dart';

@freezed
class OutletModel with _$OutletModel {
  const factory OutletModel({
    required String id,
    required String name,
    // Add your fields here
  }) = _OutletModel;

  factory OutletModel.fromJson(Map<String, dynamic> json) =>
      _$OutletModelFromJson(json);
}
