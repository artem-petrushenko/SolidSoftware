import 'package:solid_software/src/feature/rainbow/data/provider/local/rainbow_storage.dart';

import 'package:solid_software/src/feature/rainbow/data/client/shared_preferences_manager.dart';

class RainbowStorageImpl implements RainbowStorage {
  const RainbowStorageImpl({
    required SharedPreferencesManager sharedPreferencesManager,
  }) : _sharedPreferencesManager = sharedPreferencesManager;

  final SharedPreferencesManager _sharedPreferencesManager;

  @override
  int getBackgroundColor() =>
      _sharedPreferencesManager.getInt('background') ?? 0xFF000000;

  @override
  int getTextColor() => _sharedPreferencesManager.getInt('text') ?? 0xFFFFFFFF;

  @override
  Future<void> setBackgroundColor(final int color) async =>
      await _sharedPreferencesManager.setInt('background', color);

  @override
  Future<void> setTextColor(final int color) async =>
      await _sharedPreferencesManager.setInt('text', color);
}
