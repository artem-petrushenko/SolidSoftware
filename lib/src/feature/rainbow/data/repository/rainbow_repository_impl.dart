import 'package:solid_software/src/feature/rainbow/data/provider/local/rainbow_storage.dart';

import 'package:solid_software/src/feature/rainbow/data/repository/rainbow_repository.dart';

class RainbowRepositoryImpl implements RainbowRepository {
  const RainbowRepositoryImpl({
    required RainbowStorage rainbowStorage,
  }) : _rainbowStorage = rainbowStorage;

  final RainbowStorage _rainbowStorage;

  @override
  int getBackgroundColor() => _rainbowStorage.getBackgroundColor();

  @override
  int getTextColor() => _rainbowStorage.getTextColor();

  @override
  Future<void> setBackgroundColor(int color) async =>
      await _rainbowStorage.setBackgroundColor(color);

  @override
  Future<void> setTextColor(int color) async =>
      await _rainbowStorage.setTextColor(color);
}
