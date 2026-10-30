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
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
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
                  textColor: AppColors.governorBay,
                ).plusExtraBold_12,
              ),
              Text(
                'Pick up where you left off',
                style: AppTextStyles().semanticHeading1_28,
              ),
              Text(
                'Sign in to see your words and lessons.',
                style: AppTextStyles(textColor: AppColors.comet).plusMedium_15,
              ),
              SizedBox(height: 10),
              Text('Email', style: AppTextStyles().plusExtraBold_14),
              CustomTextField(),
              SizedBox(height: 5),
              Text('Password', style: AppTextStyles().plusExtraBold_14),
              CustomTextField(suffixIcon: AppAssets.eyeIcon),
              Text(
                'Forgot password?',
                style: AppTextStyles(
                  textColor: AppColors.governorBay,
                ).plusExtraBold_14,
                textAlign: .end,
              ),
              SizedBox(height: 220),
              CustomButton(
                onPressed: () {},
                buttonText: 'Sign in',
                buttonColor: AppColors.royalBlue,
                textStyle: AppTextStyles(
                  textColor: AppColors.white,
                ).semanticLink_17,
                buttonWidth: .infinity,
                buttonIcon: AppAssets.arrowRightIcon,
              ),
              Text(
                'New here? Create an account',
                style: AppTextStyles(
                  textColor: AppColors.governorBay,
                ).semanticLink_15,
                textAlign: .center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
