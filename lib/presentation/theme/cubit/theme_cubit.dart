import 'package:ai_chat_flutter/presentation/theme/theme_data.dart';
import 'package:ai_chat_flutter/presentation/theme/theme_type.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/scheduler.dart';
part 'theme_state.dart';

ThemeCubit changeThemeCubit = ThemeCubit()..onDecideThemeChange();

class ThemeCubit extends Cubit<ChangeThemeState> {
  ThemeCubit() : super(ChangeThemeState.customTheme(type: ThemeType.custom));

  void changeToLightTheme() {
    _saveOptionValue(0);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    emit(ChangeThemeState.lightTheme(type: ThemeType.light));
  }

  void changeToDarkTheme() {
    _saveOptionValue(1);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    emit(ChangeThemeState.darkTheme(type: ThemeType.dark));
  }

  void changeToCustomTheme() {
    _saveOptionValue(2);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light ==
                SchedulerBinding.instance.platformDispatcher.platformBrightness
            ? Brightness.dark
            : Brightness.light,
      ),
    );
    emit(ChangeThemeState.customTheme(type: ThemeType.custom));
  }

  void onDecideThemeChange() async {
    final optionValue = await getOption();
    if (optionValue == 0) {
      changeToLightTheme();
    } else if (optionValue == 1) {
      changeToDarkTheme();
    } else if (optionValue == 2) {
      changeToCustomTheme();
    }
  }

  Future<void> _saveOptionValue(int optionValue) async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setInt('theme_option', optionValue);
  }

  Future<int> getOption() async {
    try {
      var preferences = await SharedPreferences.getInstance();
      int option = preferences.getInt('theme_option') ?? 2;
      return option;
    } catch (e) {
      return 0;
    }
  }

  Future<ThemeType> getThemeType() async {
    var option = await getOption();
    return ThemeType.values[option];
  }
}
