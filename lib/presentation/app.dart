import 'package:ai_chat_flutter/presentation/on_boarding/on_boarding_page.dart';
import 'package:ai_chat_flutter/presentation/theme/cubit/theme_cubit.dart';
import 'package:ai_chat_flutter/presentation/theme/theme_type.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool _isDemoUsingDynamicColors = false;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(),
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
                    _isDemoUsingDynamicColors = true;
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
                  SystemChrome.setSystemUIOverlayStyle(
                    SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent,
                      statusBarIconBrightness: Brightness.light ==
                                  SchedulerBinding.instance.platformDispatcher
                                      .platformBrightness &&
                              (themeState.type == ThemeType.light ||
                                  themeState.type == ThemeType.custom)
                          ? Brightness.dark
                          : Brightness.light,
                    ),
                  );
                  return MaterialApp(
                    //TODO: change title
                    title: 'chat ai',
                    //позорный костыль
                    theme: themeState.type == ThemeType.custom
                        ? ThemeData(
                            colorScheme: lightColorScheme,
                            useMaterial3: true,
                            // extensions: [lightCustomColors],
                          )
                        : themeState.themeData,
                    darkTheme: themeState.type == ThemeType.custom
                        ? ThemeData(
                            colorScheme: darkColorScheme,
                            //useMaterial3: true,
                            // extensions: [darkCustomColors],
                          )
                        : themeState.themeData,
                    home: child,
                  );
                },
              );
            },
            child: const Scaffold(
              body: OnboardingPage(),
            ),
          );
        },
      ),
    );
  }
}
