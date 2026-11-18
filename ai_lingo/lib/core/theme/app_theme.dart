import 'package:ai_lingo/core/theme/app_colors.dart';
import 'package:ai_lingo/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
    fontFamily: AppFonts.plusJakartaSans,
    scaffoldBackgroundColor: AppColors.neutralWhite,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.neutralWhite,
      surfaceTintColor: Colors.transparent,
    ),
  );
}
