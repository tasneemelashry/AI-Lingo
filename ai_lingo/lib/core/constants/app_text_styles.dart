import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Sora => headings
  static const TextStyle splashTitle = TextStyle(
    fontFamily: 'sora',
    fontWeight: FontWeight.w700,
    fontSize: 40,
    letterSpacing: -1,
    color: AppColors.white,
  );
  static const TextStyle h1 = TextStyle(
    // Welcome headline
    fontFamily: 'sora',
    fontWeight: FontWeight.w700,
    fontSize: 28,
    height: 1.2,
    letterSpacing: -0.5,
    color: AppColors.textPrimary,
  );
  static const TextStyle greeting = TextStyle(
    // "Hi, name" (Semantic/Heading 1)
    fontFamily: 'sora',
    fontWeight: FontWeight.w700,
    fontSize: 26,
    height: 1.2,
    letterSpacing: -0.4,
    color: AppColors.textPrimary,
  );
  static const TextStyle logoWordMark = TextStyle(
    fontFamily: 'sora',
    fontWeight: FontWeight.w700,
    fontSize: 22,
    letterSpacing: -0.3,
    color: AppColors.textPrimary,
  );
  static const TextStyle h2 = TextStyle(
    // hero card title
    fontFamily: 'sora',
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 1.25,
    color: AppColors.textPrimary,
  );
  static const TextStyle h3 = TextStyle(
    // lesson card title
    fontFamily: 'sora',
    fontWeight: FontWeight.w700,
    fontSize: 19,
    height: 1.25,
    color: AppColors.textPrimary,
  );
  static const TextStyle wordTitle = TextStyle(
    // new-word popup
    fontFamily: 'sora',
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: AppColors.textPrimary,
  );
  static const TextStyle sectionTitle = TextStyle(
    // "Explore scenarios", app bar
    fontFamily: 'sora',
    fontWeight: FontWeight.w700,
    fontSize: 17,
    color: AppColors.textPrimary,
  );

  // PlusJakartaSans
  static const TextStyle button = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w800,
    fontSize: 17,
    color: AppColors.white,
  );
  static const TextStyle buttonMedium = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w800,
    fontSize: 16,
    color: AppColors.white,
  );
  static const TextStyle buttonSmall = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w800,
    fontSize: 14,
    color: AppColors.white,
  );
  static const TextStyle link = TextStyle(
    // "Sign in", "See all", "Finish"
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w800,
    fontSize: 15,
    color: AppColors.primaryDark,
  );
  static const TextStyle itemTitle = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w800,
    fontSize: 15,
    color: AppColors.textPrimary,
  );
  static const TextStyle eyebrow = TextStyle(
    // "TODAY'S GOAL", "PICKED FOR YOU"
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w800,
    fontSize: 12,
    letterSpacing: 1,
    color: AppColors.primaryDark,
  );
  static const TextStyle chip = TextStyle(
    // word chips
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w800,
    fontSize: 13,
    color: AppColors.textPrimary,
  );
  static const TextStyle badge = TextStyle(
    // "NEW WORD"
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w800,
    fontSize: 11,
    letterSpacing: 0.5,
    color: AppColors.newText,
  );

  static const TextStyle body = TextStyle(
    // Welcome subtitle
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: 1.5,
    color: AppColors.textSecondary,
  );
  static const TextStyle chatMessage = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: 1.5,
    color: AppColors.textPrimary,
  );
  static const TextStyle bodySmall = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w500,
    fontSize: 13,
    height: 1.4,
    color: AppColors.textSecondary,
  );
  static const TextStyle caption = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColors.textSecondary,
  );
  static const TextStyle captionBold = TextStyle(
    // nav label, weekday letters
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w700,
    fontSize: 12,
    color: AppColors.textSecondary,
  );
  static const TextStyle labelBold = TextStyle(
    // "Ready for a short chat?"
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w700,
    fontSize: 13,
    color: AppColors.textSecondary,
  );
  static const TextStyle bubble = TextStyle(
    // speech bubbles in illustrations
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w700,
    fontSize: 13,
    height: 1.4,
    color: AppColors.textPrimary,
  );
  static const TextStyle inputHint = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: AppColors.textSecondary,
  );
  static const TextStyle smallSubtitle = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.white,
  );
}
