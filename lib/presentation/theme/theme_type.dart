enum ThemeType { dark, light, custom }

extension ThemeTypeExtension on ThemeType {
  static const values = {
    0: ThemeType.dark,
    1: ThemeType.light,
    2: ThemeType.custom,
  };

  ThemeType? get value => values[this];
}
