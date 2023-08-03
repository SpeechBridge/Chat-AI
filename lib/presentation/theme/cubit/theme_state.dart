part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {}

class ChangeThemeState extends ThemeState {
  final ThemeData? themeData;
  final ThemeType type;

  ChangeThemeState({
    this.themeData,
    required this.type,
  });

  factory ChangeThemeState.lightTheme({required ThemeType type}) {
    return ChangeThemeState(
      themeData: lightThemeData,
      type: type,
    );
  }

  factory ChangeThemeState.darkTheme({required ThemeType type}) {
    return ChangeThemeState(
      themeData: darkThemeData,
      type: type,
    );
  }

  factory ChangeThemeState.customTheme({required ThemeType type}) {
    return ChangeThemeState(
      type: type,
    );
  }

  @override
  String toString() => 'ChangeThemeState(themeData: $themeData, type: $type)';
}
