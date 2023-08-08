import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignNotFoundWidget extends StatelessWidget {
  const SignNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100.h,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 209.h, maxWidth: 314.h),
          child: Image.asset("assets/images/signNotFound.png"),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          'Ничего не найдено',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 32.sp,
              ),
        ),
      ],
    );
  }
}
