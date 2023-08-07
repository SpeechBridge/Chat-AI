import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchSignView extends StatefulWidget {
  const SearchSignView({super.key});

  @override
  SearchSignViewState createState() => SearchSignViewState();
}

class SearchSignViewState extends State<SearchSignView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: KeyboardVisibilityBuilder(
        controller: KeyboardVisibilityController(),
        builder: (context, isKeyboardVisible) {
          if (!isKeyboardVisible) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
          return Padding(
            padding: EdgeInsets.only(top: 40.h, left: 30.h, right: 30.h),
            child: Column(
              children: [
                SearchBar(
                  controller: _controller,
                  hintText: 'Начните писать...',
                  leading: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  onTap: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
