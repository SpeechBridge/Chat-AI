import 'package:ai_chat_flutter/presentation/camera_page/view/camera_view.dart';
import 'package:ai_chat_flutter/presentation/search_sign/search_sign_page.dart';
import 'package:ai_chat_flutter/presentation/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const [
        CameraApp(),
        SearchSignPage(),
        SettingsWidget(),
      ][selectedPageIndex],
      bottomNavigationBar: SizedBox(
        height: 80.h,
        child: NavigationBar(
          selectedIndex: selectedPageIndex,
          onDestinationSelected: (int index) {
            //TODO: to bloc
            setState(() {
              selectedPageIndex = index;
            });
          },
          destinations: const <NavigationDestination>[
            NavigationDestination(
              selectedIcon: Icon(Icons.waving_hand),
              icon: Icon(Icons.waving_hand_outlined),
              label: 'Главная',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.auto_stories),
              icon: Icon(Icons.auto_stories_outlined),
              label: 'Словарь',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings_outlined),
              label: 'Настройки',
            ),
          ],
        ),
      ),
    );
  }
}
