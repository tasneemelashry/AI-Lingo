import 'package:ai_lingo/core/constants/app_assets.dart';
import 'package:ai_lingo/core/constants/app_colors.dart';
import 'package:ai_lingo/core/constants/app_text_styles.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralWhite,
      appBar: AppBar(
        backgroundColor: AppColors.neutralWhite,
        leading: Icon(Icons.arrow_back_ios_new),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            spacing: 10,
            crossAxisAlignment: .stretch,
            children: [
              Image.asset(
                AppAssets.appLogo,
                width: 64,
                height: 64,
                alignment: .topStart,
              ),
              SizedBox(height: 5),
              Text(
                'WELCOME BACK',
                style: AppTextStyles(
                  textColor: AppColors.brandPrimaryDark,
                ).labelStrong12,
              ),
              Text(
                'Pick up where you left off',
                style: AppTextStyles().headingScreenTitle28,
              ),
              Text(
                'Sign in to see your words and lessons.',
                style: AppTextStyles(
                  textColor: AppColors.textSecondary,
                ).bodyDefault15,
              ),
              SizedBox(height: 10),
              Text('Email', style: AppTextStyles().formFieldLabel14),
              CustomTextField(),
              SizedBox(height: 5),
              Text('Password', style: AppTextStyles().formFieldLabel14),
              CustomTextField(suffixIcon: AppAssets.eyeIcon),
              Text(
                'Forgot password?',
                style: AppTextStyles(
                  textColor: AppColors.brandPrimaryDark,
                ).formFieldLabel14,
                textAlign: .end,
              ),
              SizedBox(height: 220),
              CustomButton(
                onPressed: () {},
                buttonText: 'Sign in',
                buttonColor: AppColors.brandPrimary,
                textStyle: AppTextStyles(
                  textColor: AppColors.neutralWhite,
                ).buttonLabel17,
                buttonWidth: .infinity,
                buttonIcon: AppAssets.arrowRightIcon,
              ),
              Text(
                'New here? Create an account',
                style: AppTextStyles(
                  textColor: AppColors.brandPrimaryDark,
                ).labelStrong15,
                textAlign: .center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
