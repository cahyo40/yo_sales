import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_nav_model.freezed.dart';
part 'bottom_nav_model.g.dart';

@freezed
class BottomNavModel with _$BottomNavModel {
  const factory BottomNavModel({
    required String id,
    required String name,
    // Add your fields here
  }) = _BottomNavModel;

  factory BottomNavModel.fromJson(Map<String, dynamic> json) =>
      _$BottomNavModelFromJson(json);
}
