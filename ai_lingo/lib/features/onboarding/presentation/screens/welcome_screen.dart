import 'package:ai_lingo/core/constants/app_assets.dart';
import 'package:ai_lingo/core/constants/app_colors.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/features/onboarding/presentation/widgets/row_features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Image.asset(AppAssets.appLogo, width: 15, height: 15),
        ),
        title: Text(
          'AI-Lingo',
          style: TextStyle(
            fontFamily: AppAssets.sora,
            fontWeight: FontWeight.w700,
            fontSize: 22,
            letterSpacing: -0.3,
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                'Sign in',
                style: TextStyle(
                  fontFamily: AppAssets.plus,
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  color: AppColors.primaryDark,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          spacing: 15,
          crossAxisAlignment: .stretch,
          children: [
            SvgPicture.asset(AppAssets.welcomeImage),
            Text(
              'LEARN THROUGH REAL CONVERSATIONS',
              style: TextStyle(
                fontFamily: AppAssets.plus,
                fontWeight: FontWeight.w800,
                fontSize: 12,
                letterSpacing: 1,
                color: AppColors.primaryDark,
              ),
            ),
            Text(
              'Practice real conversations. Build real confidence.',
              style: TextStyle(
                fontFamily: AppAssets.sora,
                fontWeight: FontWeight.w700,
                fontSize: 26,
                height: 1.2,
                letterSpacing: -0.4,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              'Short chats built around your level, your interests and the words you already know.',
              style: TextStyle(
                fontFamily: AppAssets.plus,
                fontWeight: FontWeight.w500,
                fontSize: 15,
                height: 1.5,
                color: AppColors.textSecondary,
              ),
            ),
            RowFeatures(
              featureIcon: AppAssets.practiceIcon,
              featureTitle: 'Scenarios made for you',
              featureScript: 'Cafés, interviews, travel and study chats',
            ),
            RowFeatures(
              featureIcon: AppAssets.bookIcon,
              featureTitle: 'Words that stick',
              featureScript: 'Reuse what you know, learn a few new ones',
            ),
            RowFeatures(
              featureIcon: AppAssets.downloadIcon,
              featureTitle: 'Learn anywhere',
              featureScript: 'Saved words and lessons work offline',
            ),
            Spacer(),
            CustomButton(
              onPressed: () {},
              buttonText: 'Get started',
              buttonColor: AppColors.primary,
              textStyle: TextStyle(
                fontFamily: AppAssets.plus,
                fontWeight: FontWeight.w800,
                fontSize: 17,
                color: AppColors.white,
              ),
              buttonWidth: .infinity,
              buttonIcon: AppAssets.arrowRightIcon,
            ),
            Text(
              'Short, focused sessions. Progress at your pace.',
              style: TextStyle(
                fontFamily: AppAssets.plus,
                fontWeight: FontWeight.w500,
                fontSize: 13,
                height: 1.4,
                color: AppColors.textSecondary,
              ),
              textAlign: .center,
            ),
            SizedBox(height: 2),
          ],
        ),
      ),
    );
  }
}
