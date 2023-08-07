import 'package:ai_chat_flutter/presentation/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showThemeModalBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, top: 30.0.h, bottom: 10.h),
              child: const Text(
                'Тема',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                alignment: Alignment.centerLeft,
                minimumSize: Size.fromHeight(50.h),
                padding: EdgeInsets.only(left: 20.w),
              ),
              child: const Text('Всегда светлая тема'),
              onPressed: () {
                context.read<ThemeCubit>().changeToLightTheme();
                Navigator.pop(context);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                alignment: Alignment.centerLeft,
                minimumSize: Size.fromHeight(50.h),
                padding: EdgeInsets.only(left: 20.w),
              ),
              child: const Text('Всегда тёмная тема'),
              onPressed: () {
                context.read<ThemeCubit>().changeToDarkTheme();
                Navigator.pop(context);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                alignment: Alignment.centerLeft,
                minimumSize: Size.fromHeight(50.h),
                padding: EdgeInsets.only(left: 20.w),
              ),
              child: const Text('Динамичная тема как в системе'),
              onPressed: () {
                context.read<ThemeCubit>().changeToCustomTheme();
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      );
    },
  );
}
