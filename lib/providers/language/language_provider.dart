import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yo_sales/core/services/cache.dart';

part 'language_provider.g.dart';

const supportLang = ['en', 'id'];

@Riverpod(keepAlive: true)
class LanguageNotifier extends _$LanguageNotifier {
  @override
  Locale build() => Locale(CacheServices.locale);

  // method to change language
  Future<void> changeLanguage(String langCode) async {
    if (!supportLang.contains(langCode)) return;
    state = Locale(langCode);
    await CacheServices.setLocale(langCode);
  }
}
