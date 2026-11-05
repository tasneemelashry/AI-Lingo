import 'package:ai_lingo/core/constants/app_assets.dart';
import 'package:ai_lingo/core/constants/app_colors.dart';
import 'package:ai_lingo/core/constants/app_text_styles.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/features/auth/presentation/screens/login_screen.dart';
import 'package:ai_lingo/features/onboarding/presentation/widgets/row_features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: Image.asset(AppAssets.appLogo, width: 15.w, height: 15.h),
        ),
        title: Text('AI-Lingo', style: AppTextStyles().headingPageTitle22),
        actions: [
          TextButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.only(right: 12.r),
              child: InkWell(
                onTap: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => LoginScreen())),
                child: Text(
                  'Sign in',
                  style: AppTextStyles(
                    textColor: AppColors.brandPrimaryDark,
                  ).labelStrong15,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: .stretch,
          children: [
            SvgPicture.asset(AppAssets.welcomeImage),
            Text(
              'LEARN THROUGH REAL CONVERSATIONS',
              style: AppTextStyles(
                textColor: AppColors.brandPrimaryDark,
              ).labelStrong12,
            ),
            Text(
              'Practice real conversations. Build real confidence.',
              style: AppTextStyles().headingScreenTitle26,
            ),
            Text(
              'Short chats built around your level, your interests and the words you already know.',
              style: AppTextStyles().bodyDefault15,
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
            SizedBox(height: 10.h),
            CustomButton(
              onPressed: () {},
              buttonText: 'Get started',
              buttonIcon: AppAssets.arrowRightIcon,
            ),
            Text(
              'Short, focused sessions. Progress at your pace.',
              style: AppTextStyles(
                textColor: AppColors.textSecondary,
              ).bodySmall13,
              textAlign: .center,
            ),
          ],
        ),
      ),
    );
  }
}
