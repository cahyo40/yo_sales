import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yo_sales/core/services/cache.dart';
import 'package:yo_sales/models/theme_mode/theme_mode_model.dart';

part 'switch_theme_provider.g.dart';

@riverpod
class SwitchThemeNotifier extends _$SwitchThemeNotifier {
  @override
  ThemeModeModel build() => CacheServices.themeMode;

  Future<void> setThemeMode(ThemeModeModel mode) async {
    state = mode;
    await CacheServices.setTheme(mode);
  }

  // Add your state management logic here
  ThemeMode toThemeMode() => state.when(
    system: () => ThemeMode.system,
    light: () => ThemeMode.light,
    dark: () => ThemeMode.dark,
  );
}
