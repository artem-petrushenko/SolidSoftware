import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  const SharedPreferencesManager({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  Future<void> setInt(final String key, final int value) async =>
      await _sharedPreferences.setInt(key, value);

  int? getInt(final String key) => _sharedPreferences.getInt(key);
}
