import 'package:ai_lingo/core/constants/app_assets.dart';
import 'package:ai_lingo/core/constants/app_colors.dart';
import 'package:ai_lingo/core/constants/app_text_styles.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/features/onboarding/widgets/row_features.dart';
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
        title: Text('AI-Lingo', style: AppTextStyles.logoWordMark),
        actions: [
          TextButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text('Sign in', style: AppTextStyles.link),
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
              style: AppTextStyles.eyebrow,
            ),
            Text(
              'Practice real conversations. Build real confidence.',
              style: AppTextStyles.greeting,
            ),
            Text(
              'Short chats built around your level, your interests and the words you already know.',
              style: AppTextStyles.body,
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
              textStyle: AppTextStyles.button,
              buttonWidth: .infinity,
              buttonIcon: AppAssets.arrowRightIcon,
            ),
            Text(
              'Short, focused sessions. Progress at your pace.',
              style: AppTextStyles.bodySmall,
              textAlign: .center,
            ),
            SizedBox(height: 2),
          ],
        ),
      ),
    );
  }
}
