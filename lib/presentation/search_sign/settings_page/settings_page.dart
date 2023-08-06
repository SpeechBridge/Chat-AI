import 'package:ai_chat_flutter/presentation/search_sign/settings_page/widgets/settings_image_widget.dart';
import 'package:ai_chat_flutter/presentation/search_sign/settings_page/widgets/settings_panel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 48.h,
            ),
            const SettingsImageWidget(),
            SizedBox(
              height: 42.h,
            ),
            const SettingsPanelWidget(),
          ],
        ),
      ),
    );
  }
}
