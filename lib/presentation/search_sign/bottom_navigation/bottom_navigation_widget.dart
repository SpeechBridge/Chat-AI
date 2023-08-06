import 'package:ai_chat_flutter/presentation/search_sign/settings_page/settings_page.dart';
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
        Center(
          child: Text(
            'In progress...',
          ),
        ),
        Center(
          child: Text(
            'In progress...',
          ),
        ),
        SettingsWidget(),
      ][selectedPageIndex],
      bottomNavigationBar: Container(
        height: 80.h,
        child: NavigationBar(
          selectedIndex: selectedPageIndex,
          onDestinationSelected: (int index) {
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
