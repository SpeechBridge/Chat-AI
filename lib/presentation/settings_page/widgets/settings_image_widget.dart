import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsImageWidget extends StatelessWidget {
  const SettingsImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 196.h, maxWidth: 196.h),
          child: Image.asset("assets/images/settings.png"),
        ),
        SizedBox(
          height: 11.h,
        ),
        Text(
          'Жесты',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 32.sp,
              ),
        ),
      ],
    );
  }
}
