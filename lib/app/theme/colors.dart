import 'package:flutter/material.dart';

class Colorz {
  // App theme colors
  static const Color main = Color(0xFFA2016E);
  static const Color secondary = Color(0xFF5C1C47);

  // Background colors
  static const Color light = Color(0xFFFFFFFF);
  static const Color dark = Color(0xFF060606);
  static const Color primaryBackground = Color(0xFFFfFfFF);
  static Color violet = const Color(0xFFE5009B).withOpacity(0.5);
  static const Color lightViolet = Color(0xFFFBE6EC);
  static const Color darkViolet = Color(0xFF360C18);
  static Color pollBackground = const Color(0xFFFAF4F7);

  // Grediants
  static const Color gradient1 = Color(0xff4F00B7);
  static const Color gradient2 = Color(0xff720096);
  static const Color gradient3 = Color(0xff950074);
  static Color gredient4 = const Color(0xFF716582).withOpacity(0.0);
  static const Color gredient5 = Color(0xFF9E86A9);

  // Text colors
  static const Color textPrimary = Color(0xFF22363D);
  static Color textSecondary = Colorz.textPrimary.withOpacity(0.6);
  static const Color textWhite = Colors.white;
  static const Color textBlack = Color(0xFF000000);
  static const Color textGrey = Color(0xFF7a868b);
  static Color grey = const Color(0xFF22363D).withOpacity(0.6);
  static Color textVioletGrey = const Color(0xFFDCDCFF).withOpacity(0.6);
  static Color textFormFieldDark = const Color(0xFFDCDCFF).withOpacity(0.1);
  static const Color violetGrey = Color(0xFFDCDCFF);

  // Button colors
  static const Color appleButton = Color(0xFF0F0E0E);
  static Color tabButtonShadow = const Color(0xFF720198).withOpacity(0.4);
  static Color buttonShadow = const Color(0xFF720198).withOpacity(0.5);

  // Border colors
  static Color border = Colorz.textPrimary.withOpacity(0.1);
  static Color formBorder = Colorz.main.withOpacity(0.2);

  // Error and validation colors
  static const Color error = Color(0xFFFF0011);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);
}
