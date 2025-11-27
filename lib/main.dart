import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yo_sales/core/services/cache.dart';
import 'package:yo_sales/l10n/app_localizations.dart';
import 'package:yo_sales/providers/language/language_provider.dart';
import 'package:yo_sales/providers/switch_theme/switch_theme_provider.dart';
import 'package:yo_ui/yo_ui_base.dart';

import 'core/navigation/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheServices.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(languageNotifierProvider);
    final theme = ref.watch(switchThemeNotifierProvider);
    YoLogger.debug('Current Theme Mode: $theme');
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Yo Sales',
      theme: YoTheme.lightTheme(context, YoColorScheme.outdoorCalm),
      darkTheme: YoTheme.darkTheme(context, YoColorScheme.outdoorCalm),
      debugShowCheckedModeBanner: false,
      themeMode: ref.watch(switchThemeNotifierProvider.notifier).toThemeMode(),
      // themeMode: ThemeMode.light,
      locale: lang,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
