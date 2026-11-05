import 'package:ai_lingo/core/constants/app_colors.dart';
import 'package:ai_lingo/core/constants/app_text_styles.dart';
import 'package:ai_lingo/features/onboarding/presentation/widgets/circle_container.dart';
import 'package:flutter/material.dart';
import 'package:ai_lingo/core/constants/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brandPrimary,
      body: Stack(
        children: [
          Positioned(
            top: -80.r,
            left: -80.r,
            child: CircleContainer(size: 250.r),
          ),
          Positioned(
            bottom: -70.r,
            right: -70.r,
            child: CircleContainer(size: 250.r),
          ),
          Center(
            child: Column(
              spacing: 5.h,
              mainAxisSize: .min,
              children: [
                Container(
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: AppColors.neutralWhite,
                    borderRadius: BorderRadius.circular(48.r),
                  ),
                  child: Image.asset(
                    AppAssets.splashLogo,
                    width: 104.w,
                    height: 104.h,
                  ),
                ),
                Text(
                  'AI-Lingo',
                  style: AppTextStyles(
                    textColor: AppColors.neutralWhite,
                  ).splashAppName40,
                ),
                Text(
                  'Chat your way to better English.',
                  style: AppTextStyles(
                    textColor: AppColors.neutralWhite,
                  ).splashTagline16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
