abstract class RainbowRepository {
  const RainbowRepository();

  Future<void> setBackgroundColor(final int color);

  Future<void> setTextColor(final int color);

  int getBackgroundColor();

  int getTextColor();
}
