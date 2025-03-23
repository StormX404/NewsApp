import 'package:shared_preferences/shared_preferences.dart';

mixin Pref {
  static SharedPreferences? _instance;
  static bool isInitialized = false;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
    isInitialized = true;
  }

  static Future<void> setBool(String key, bool value) async {
    if (!isInitialized) await init();
    await _instance!.setBool(key, value);
  }

  static bool getBool(String key) {
    if (!isInitialized) return false;
    return _instance!.getBool(key) ?? false;
  }

  static Future<bool> shouldShowOnboarding() async {
    if (!isInitialized) await init();
    return _instance!.getBool('IsFirstTime') ?? true;
  }

  static Future<void> completeOnboarding() async {
    await setBool('IsFirstTime', false);
  }
}
