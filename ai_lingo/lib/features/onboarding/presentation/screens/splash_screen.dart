import 'package:ai_lingo/core/constants/app_colors.dart';
import 'package:ai_lingo/core/constants/app_text_styles.dart';
import 'package:ai_lingo/features/onboarding/presentation/widgets/circle_container.dart';
import 'package:flutter/material.dart';
import 'package:ai_lingo/core/constants/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.royalBlue,
      body: Stack(
        children: [
          Positioned(top: -80, left: -80, child: CircleContainer(size: 250)),
          Positioned(
            bottom: -70,
            right: -70,
            child: CircleContainer(size: 250),
          ),
          Center(
            child: Column(
              spacing: 5,
              mainAxisSize: .min,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(48),
                  ),
                  child: Image.asset(
                    AppAssets.splashLogo,
                    width: 104,
                    height: 104,
                  ),
                ),
                Text(
                  'AI-Lingo',
                  style: AppTextStyles(
                    textColor: AppColors.white,
                  ).semanticLink_40,
                ),
                Text(
                  'Chat your way to better English.',
                  style: AppTextStyles(
                    textColor: AppColors.white,
                  ).semanticLink_16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
