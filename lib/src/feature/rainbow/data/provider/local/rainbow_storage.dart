abstract class RainbowStorage {
  const RainbowStorage();

  Future<void> setBackgroundColor(final int color);

  int getBackgroundColor();

  Future<void> setTextColor(final int color);

  int getTextColor();
}
