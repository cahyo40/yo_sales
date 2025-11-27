import 'package:shared_preferences/shared_preferences.dart';
import 'package:yo_sales/models/theme_mode/theme_mode_model.dart';

class CacheServices {
  static late SharedPreferences cache;
  // init cache
  static Future<void> init() async =>
      cache = await SharedPreferences.getInstance();
  // l10n language
  static String get locale => cache.getString(CacheName.locale) ?? 'en';
  static Future<void> setLocale(String value) async =>
      await cache.setString(CacheName.locale, value);

  // Theme
  static ThemeModeModel get themeMode {
    final raw = cache.getString(CacheName.theme) ?? "system";
    return ThemeModeModel.values.firstWhere(
      (v) => v.key == raw,
      orElse: () => ThemeModeModel.system(),
    );
  }

  static Future<void> setTheme(ThemeModeModel t) =>
      cache.setString(CacheName.theme, t.key);

  // User

  // static Future<void> saveUser(User user) async {
  //   cache.setString(CacheName.uid, user.uid);
  //   cache.setString(CacheName.email, user.email ?? "");
  //   cache.setString(CacheName.name, user.displayName ?? "");
  //   cache.setString(CacheName.photoUrl, user.photoURL ?? "");
  // }

  static Future<Map<String, String?>> getUser() async {
    return {
      "uid": cache.getString(CacheName.uid),
      "email": cache.getString(CacheName.email),
      "name": cache.getString(CacheName.name),
    };
  }

  static Future<void> clearUser() async {
    cache.setString(CacheName.uid, "");
    cache.setString(CacheName.email, "");
    cache.setString(CacheName.name, "");
 
  }
}

class CacheName {
  static const String locale = 'locale';
  static const String theme = 'theme';

  static const String uid = 'uid';
  static const String email = 'email';
  static const String name = 'name';
 
}
