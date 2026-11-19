import 'package:ai_lingo/core/routing/routes.dart';
import 'package:ai_lingo/core/theme/app_text_styles.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12.h,
            children: [
              Text(
                'Set up your plan',
                style: AppTextStyles.headingScreenTitle26,
                textAlign: TextAlign.center,
              ),
              Text(
                'Level, interests and goals are coming soon.',
                style: AppTextStyles.bodyDefault15,
                textAlign: TextAlign.center,
              ),
              CustomButton(
                onPressed: () => Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes.home, (route) => false),
                buttonText: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
