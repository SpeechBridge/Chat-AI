import 'package:flutter/material.dart';

//удалить лишнее
class AppColors {
  static Color get textMain => const Color(0xFF1B1B1B);
// Backgrounds
  static Color get background01 => const Color(0xFFFFFFFF);
  static Color get background02 => const Color(0xFF262A34);
  static Color get background03 => const Color(0xFF1F222A);

// Colorful
  static Color get colorful01 => const Color(0xFF007DBC);
  static Color get colorful02 => const Color(0xFF687787);
  static Color get colorful03 => const Color(0xFF017F5C);
  static Color get colorful04 => const Color(0xFF007DBC);
// Color get colorful05 => const Color(0xFFA5F59C);
// Color get colorful06 => const Color(0xFFFFDD72);
// Color get colorful07 => const Color(0xFFFF968E);
  static Color get white => const Color(0xFFFFFFFF);
  static Color get buttonColor1 => const Color(0x59FFFFFF);
// States
  static Color get active => const Color(0xFFFFFFFF);
  static Color get deactive => const Color(0xFF5E6272);
  static Color get activeLightMode => const Color(0xFF200745);
  static Color get deactiveDarker => const Color(0xFF3A3D46);

  static LinearGradient get gradient07 =>
      const LinearGradient(colors: [Color(0xFFBBFFE7), Color(0xFF86FFCA)]);
}
