import 'package:ai_chat_flutter/presentation/bottom_navigation/bottom_navigation_widget.dart';
import 'package:ai_chat_flutter/presentation/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:ai_chat_flutter/presentation/on_boarding/on_boarding_page.dart';
import 'package:ai_chat_flutter/presentation/theme/cubit/theme_cubit.dart';
import 'package:ai_chat_flutter/presentation/theme/theme_type.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => changeThemeCubit,
        ),
        BlocProvider<OnBoardingCubit>(
          create: (context) => OnBoardingCubit()..checkOnBoardingCompletion(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ChangeThemeState>(
        builder: (context, themeState) {
          return ScreenUtilInit(
            designSize: const Size(360, 800),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context, Widget? child) {
              if (kDebugMode) {
                print(themeState.type);
              }
              return DynamicColorBuilder(
                builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
                  ColorScheme lightColorScheme;
                  ColorScheme darkColorScheme;

                  if (lightDynamic != null && darkDynamic != null) {
                    lightColorScheme = lightDynamic.harmonized();
                    darkColorScheme = darkDynamic.harmonized();
                  } else {
                    lightColorScheme = ColorScheme.fromSeed(
                      seedColor: const Color.fromARGB(255, 82, 99, 79),
                    );
                    darkColorScheme = ColorScheme.fromSeed(
                      seedColor: const Color.fromARGB(255, 186, 204, 179),
                      brightness: Brightness.dark,
                    );
                  }

                  return MaterialApp(
                    title: 'AI Жесты',
                    theme: themeState.type == ThemeType.custom
                        ? ThemeData(
                            colorScheme: lightColorScheme,
                            useMaterial3: true,
                          )
                        : themeState.themeData,
                    darkTheme: themeState.type == ThemeType.custom
                        ? ThemeData(
                            colorScheme: darkColorScheme,
                            useMaterial3: true,
                          )
                        : themeState.themeData,
                    home: child,
                  );
                },
              );
            },
            child: Scaffold(
              body: context.read<OnBoardingCubit>().state.isComplete
                  ? const BottomNavigationWidget()
                  : const OnboardingPage(),
            ),
          );
        },
      ),
    );
  }
}
