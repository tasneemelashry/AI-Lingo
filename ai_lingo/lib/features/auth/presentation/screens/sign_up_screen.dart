import 'package:ai_lingo/core/constants/app_assets.dart';
import 'package:ai_lingo/core/constants/app_colors.dart';
import 'package:ai_lingo/core/constants/app_text_styles.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:ai_lingo/features/auth/presentation/screens/check_email_screen.dart';
import 'package:ai_lingo/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(leading: Icon(Icons.arrow_back_ios_new)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 100.h),
          child: Column(
            spacing: 10.h,
            crossAxisAlignment: .stretch,
            children: [
              Text(
                'LET’S GET STARTED',
                style: AppTextStyles(
                  textColor: AppColors.brandPrimaryDark,
                ).labelStrong12,
              ),
              Text(
                'Create your account',
                style: AppTextStyles().headingScreenTitle26,
              ),
              Text(
                'It takes under a minute.',
                style: AppTextStyles(
                  textColor: AppColors.textSecondary,
                ).bodyDefault15,
              ),
              SizedBox(height: 10.h),
              Text('Name', style: AppTextStyles().formFieldLabel14),
              CustomTextField(),
              SizedBox(height: 5.h),
              Text('Email', style: AppTextStyles().formFieldLabel14),
              CustomTextField(),
              SizedBox(height: 5.h),
              Text('Password', style: AppTextStyles().formFieldLabel14),
              CustomTextField(suffixIcon: AppAssets.eyeIcon),
              Text(
                'Use a mix of letters and numbers.',
                style: AppTextStyles(
                  textColor: AppColors.textSecondary,
                ).bodySmall13,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 4.8),
              CustomButton(
                onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>
                        CheckEmailScreen(emailType: 'verification'),
                  ),
                ),
                buttonText: 'Create account',
                buttonIcon: AppAssets.arrowRightIcon,
              ),
              InkWell(
                onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                ),
                child: Text(
                  'Already have an account? Sign in',
                  style: AppTextStyles(
                    textColor: AppColors.brandPrimaryDark,
                  ).labelStrong15,
                  textAlign: .center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
