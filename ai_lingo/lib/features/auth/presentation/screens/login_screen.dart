import 'package:ai_lingo/core/constants/app_assets.dart';
import 'package:ai_lingo/core/constants/app_colors.dart';
import 'package:ai_lingo/core/constants/app_text_styles.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:ai_lingo/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:ai_lingo/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: InkWell(
      //     onTap: () => Navigator.of(context).pop(),
      //     child: Icon(Icons.arrow_back_ios_new),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 100.h),
          child: Column(
            spacing: 10.h,
            crossAxisAlignment: .stretch,
            mainAxisAlignment: .center,
            children: [
              Image.asset(
                AppAssets.appLogo,
                width: 64.w,
                height: 64.h,
                alignment: .topStart,
              ),
              SizedBox(height: 5.h),
              Text(
                'WELCOME BACK',
                style: AppTextStyles(
                  textColor: AppColors.brandPrimaryDark,
                ).labelStrong12,
              ),
              Text(
                'Pick up where you left off',
                style: AppTextStyles().headingScreenTitle26,
              ),
              Text(
                'Sign in to see your words and lessons.',
                style: AppTextStyles(
                  textColor: AppColors.textSecondary,
                ).bodyDefault15,
              ),
              SizedBox(height: 10.h),
              Text('Email', style: AppTextStyles().formFieldLabel14),
              CustomTextField(),
              SizedBox(height: 5.h),
              Text('Password', style: AppTextStyles().formFieldLabel14),
              CustomTextField(suffixIcon: AppAssets.eyeIcon),
              InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ForgotPasswordScreen(),
                  ),
                ),
                child: Text(
                  'Forgot password?',
                  style: AppTextStyles(
                    textColor: AppColors.brandPrimaryDark,
                  ).formFieldLabel14,
                  textAlign: .end,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 4.5),
              CustomButton(
                onPressed: () {},
                buttonText: 'Sign in',
                buttonIcon: AppAssets.arrowRightIcon,
              ),
              InkWell(
                onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                ),
                child: Text(
                  'New here? Create an account',
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
