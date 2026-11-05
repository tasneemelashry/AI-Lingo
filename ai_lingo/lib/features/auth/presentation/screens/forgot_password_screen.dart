import 'package:ai_lingo/core/constants/app_assets.dart';
import 'package:ai_lingo/core/constants/app_colors.dart';
import 'package:ai_lingo/core/constants/app_text_styles.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:ai_lingo/features/auth/presentation/screens/check_email_screen.dart';
import 'package:ai_lingo/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          child: Column(
            spacing: 10.h,
            crossAxisAlignment: .start,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.surfaceBrandTint,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.email_outlined,
                  color: AppColors.brandPrimaryDark,
                  size: 32,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'RESET PASSWORD',
                style: AppTextStyles(
                  textColor: AppColors.brandPrimaryDark,
                ).labelStrong12,
              ),
              Text(
                'Forgot your password?',
                style: AppTextStyles().headingScreenTitle26,
              ),
              Text(
                'Enter your email and we’ll send you a link to choose a new one.',
                style: AppTextStyles(
                  textColor: AppColors.textSecondary,
                ).bodyDefault15,
              ),
              SizedBox(height: 10.h),
              Text('Email', style: AppTextStyles().formFieldLabel14),
              CustomTextField(),
              SizedBox(height: MediaQuery.of(context).size.height / 2.7),
              CustomButton(
                onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => CheckEmailScreen(emailType: 'reset',)),
                ),
                buttonText: 'Send reset link',
                buttonIcon: AppAssets.arrowRightIcon,
              ),
              InkWell(
                onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                ),
                child: Align(
                  alignment: .center,
                  child: Text(
                    'Back to sign in',
                    style: AppTextStyles(
                      textColor: AppColors.brandPrimaryDark,
                    ).labelStrong15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
