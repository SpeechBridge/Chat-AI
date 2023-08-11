import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingState(false));

  // Функция для сохранения значения в SharedPreferences после нажатия кнопки
  Future<void> completeOnBoarding() async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setBool('completed_on_boarding', true);
    emit(OnBoardingState(true));
  }

  // Функция для проверки значения в SharedPreferences при запуске приложения
  Future<void> checkOnBoardingCompletion() async {
    try {
      var preferences = await SharedPreferences.getInstance();
      bool completed = preferences.getBool('completed_on_boarding') ?? false;
      emit(OnBoardingState(completed));
    } catch (e) {
      emit(OnBoardingState(false));
    }
  }
}

class OnBoardingState {
  final bool isComplete;

  OnBoardingState(this.isComplete);
}
