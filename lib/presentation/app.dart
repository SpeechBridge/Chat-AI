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
            //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
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
                    // On Android S+ devices, use the provided dynamic color scheme.
                    // (Recommended) Harmonize the dynamic color scheme' built-in semantic colors.
                    lightColorScheme = lightDynamic.harmonized();
                    // (Optional) Customize the scheme as desired. For example, one might
                    // want to use a brand color to override the dynamic [ColorScheme.secondary].
                    // lightColorScheme = lightColorScheme.copyWith(
                    //     secondary: const Color.fromARGB(255, 82, 99, 79));
                    // Repeat for the dark color scheme.
                    darkColorScheme = darkDynamic.harmonized();
                    // darkColorScheme = darkColorScheme.copyWith(
                    //   secondary: const Color.fromARGB(255, 186, 204, 179),
                    // );
                  } else {
                    // Otherwise, use fallback schemes.
                    lightColorScheme = ColorScheme.fromSeed(
                      seedColor: const Color.fromARGB(255, 82, 99, 79),
                    );
                    darkColorScheme = ColorScheme.fromSeed(
                      seedColor: const Color.fromARGB(255, 186, 204, 179),
                      brightness: Brightness.dark,
                    );
                  }

                  return MaterialApp(
                    //TODO: change title
                    title: 'chat ai',
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
