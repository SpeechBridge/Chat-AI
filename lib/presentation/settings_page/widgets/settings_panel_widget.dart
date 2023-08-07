import 'package:ai_chat_flutter/presentation/settings_page/widgets/theme_modal_bottom_sheet.dart';
import 'package:ai_chat_flutter/presentation/theme/cubit/theme_cubit.dart';
import 'package:ai_chat_flutter/presentation/theme/theme_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPanelWidget extends StatelessWidget {
  const SettingsPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsBaseButton(
          headline: 'Оформление',
          subline: context.read<ThemeCubit>().state.type == ThemeType.custom
              ? 'Динамичная тема'
              : context.read<ThemeCubit>().state.type == ThemeType.light
                  ? 'Светлая тема'
                  : 'Темная тема',
          icon: Icons.wb_sunny_outlined,
          onPressed: () {
            showThemeModalBottomSheet(context);
          },
        ),
        SizedBox(
          height: 15.h,
        ),
        SettingsBaseButton(
          headline: 'Скорость распознавания',
          subline: 'Отклик 0.5 сек.',
          icon: Icons.lens_blur,
          onPressed: () {},
        ),
        SizedBox(
          height: 15.h,
        ),
        SettingsBaseButton(
          headline: 'Перевод в видеозвонках',
          subline: 'Отключен',
          icon: Icons.record_voice_over_outlined,
          onPressed: () {},
        ),
        SizedBox(
          height: 15.h,
        ),
        SettingsBaseButton(
          headline: 'О нас',
          subline: 'Юр. информация',
          icon: Icons.info_outline,
          onPressed: () {},
        ),
      ],
    );
  }
}

class SettingsBaseButton extends StatelessWidget {
  final String headline;
  final String subline;
  final IconData icon;
  final VoidCallback onPressed;

  const SettingsBaseButton({
    Key? key,
    required this.headline,
    required this.subline,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 324.w,
      height: 70.h,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.only(
              left: 12.w,
              top: 10.h,
              bottom: 10.h,
            ),
          ),
        ),
        onPressed: onPressed, // использование входного параметра
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 45.h / 2,
              child: Icon(
                icon,
                size: 25.h,
              ),
            ),
            SizedBox(
              width: 11.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headline,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subline,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
