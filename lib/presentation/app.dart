// ignore_for_file: library_private_types_in_public_api

import 'package:ai_chat_flutter/presentation/test_square.dart';
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
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context, Widget? child) {
              if (kDebugMode) {
                print(themeState.type);
              }
              if (themeState.type == ThemeType.custom) {
                return DynamicColorBuilder(
                  builder:
                      (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
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
                    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent,
                      statusBarIconBrightness: Brightness.light ==
                              SchedulerBinding.instance.platformDispatcher
                                  .platformBrightness
                          ? Brightness.dark
                          : Brightness.light,
                    ));
                    return MaterialApp(
                      //TODO: change title
                      title: 'chat ai',
                      theme: ThemeData(
                        colorScheme: lightColorScheme,
                        // extensions: [lightCustomColors],
                      ),
                      darkTheme: ThemeData(
                        colorScheme: darkColorScheme,
                        // extensions: [darkCustomColors],
                      ),
                      home: child,
                    );
                  },
                );
              } else {
                SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: themeState.type == ThemeType.light
                      ? Brightness.dark
                      : Brightness.light,
                ));
                return MaterialApp(
                  title: 'chat ai',
                  theme: themeState.themeData,
                  home: child,
                );
              }
            },
            child: const Home(),
          );
        },
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String dynamicMsg =
        _isDemoUsingDynamicColors ? ' (dynamic)' : ' (not dynamic)';

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(35),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                TextButton(
                  onPressed: () {
                    context.read<ThemeCubit>().changeToLightTheme();
                  },
                  child: const Text('Light'),
                ),
                TextButton(
                  onPressed: () {
                    context.read<ThemeCubit>().changeToDarkTheme();
                  },
                  child: const Text('Dark'),
                ),
                TextButton(
                  onPressed: () {
                    context.read<ThemeCubit>().changeToCustomTheme();
                  },
                  child: const Text('Custom'),
                ),
                Text(
                  context.read<ThemeCubit>().state.type.toString(),
                ),
              ]),
              SizedBox(height: 20.h),
              ColoredSquare(
                Theme.of(context).colorScheme.primary,
                'ColorScheme.primary$dynamicMsg',
              ),
              ColoredSquare(
                Theme.of(context).colorScheme.secondary,
                'ColorScheme.secondary',
              ),
              ColoredSquare(
                Theme.of(context).colorScheme.tertiary,
                'ColorScheme.tertiary',
              ),
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  errorText: 'This color is ColorScheme.error$dynamicMsg',
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
