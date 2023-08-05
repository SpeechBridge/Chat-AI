import 'package:ai_chat_flutter/presentation/on_boarding/on_boarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SinglePage extends StatelessWidget {
  const SinglePage({
    Key? key,
    required this.item,
  }) : super(key: key);
  final OnboardingItem item;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 276.h, maxWidth: 276.h),
          child: Image.asset(item.image),
        ),
        SizedBox(
          height: 54.h,
        ),
        Text(
          item.headline,
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.w800,
            // height: 0.8,
            // letterSpacing: 0.8,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 14.h,
        ),
        Text(
          item.subline,
          style: TextStyle(
            fontSize: 21.sp,
            // height: 1.5,
            // letterSpacing: 0.8,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
