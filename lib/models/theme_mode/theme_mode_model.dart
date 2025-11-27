import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_mode_model.freezed.dart';

@freezed
abstract class ThemeModeModel with _$ThemeModeModel {
  const factory ThemeModeModel.system() = _System;
  const factory ThemeModeModel.light() = _Light;
  const factory ThemeModeModel.dark() = _Dark;
  const ThemeModeModel._();

  String get key =>
      when(system: () => 'system', light: () => 'light', dark: () => 'dark');

  static const List<ThemeModeModel> values = [
    ThemeModeModel.system(),
    ThemeModeModel.light(),
    ThemeModeModel.dark(),
  ];
}
