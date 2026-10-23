import 'package:ai_lingo/core/constants/app_colors.dart';
import 'package:ai_lingo/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:ai_lingo/core/constants/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Positioned(
            top: -80,
            left: -80,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: .circle,
                color: AppColors.primarySoft,
              ),
            ),
          ),
          Positioned(
            bottom: -70,
            right: -70,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: .circle,
                color: AppColors.primarySoft,
              ),
            ),
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
                Text('AI-Lingo', style: AppTextStyles.splashTitle),
                Text(
                  'Chat your way to better English.',
                  style: AppTextStyles.smallSubtitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
