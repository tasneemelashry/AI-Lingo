import 'package:ai_lingo/core/constants/app_colors.dart';
import 'package:ai_lingo/core/constants/app_text_styles.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key, required this.emailType});

  final String emailType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(leading: Icon(Icons.arrow_back_ios_new)),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
        child: Column(
          spacing: 5.h,
          children: [
            Expanded(
              child: Column(
                spacing: 14.h,
                mainAxisAlignment: .center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20.r),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceBrandTint,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Icon(
                      Icons.email_outlined,
                      color: AppColors.brandPrimaryDark,
                      size: 52.r,
                    ),
                  ),
                  Text(
                    'Check your email',
                    style: AppTextStyles().headingHeroTitle26,
                  ),
                  Text(
                    'We sent a $emailType link to name@example.com. \nIt works for 30 minutes.',
                    style: AppTextStyles(
                      textColor: AppColors.textSecondary,
                    ).bodyDefault15,
                    textAlign: .center,
                  ),
                  Container(
                    padding: EdgeInsets.all(20.r),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceBrandTint,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Row(
                      spacing: 10.w,
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          size: 20.r,
                          color: AppColors.brandPrimaryDark,
                        ),
                        Text(
                          'Can’t find it? Check your spam folder.',
                          style: AppTextStyles(
                            textColor: AppColors.textSecondary,
                          ).bodyHint14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()),
              ),
              buttonText: 'Back to sign in',
            ),
            Text(
              'Resend the link',
              style: AppTextStyles(
                textColor: AppColors.brandPrimaryDark,
              ).labelStrong15,
            ),
          ],
        ),
      ),
    );
  }
}
