import 'package:ai_lingo/core/constants/app_colors.dart';
import 'package:ai_lingo/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowFeatures extends StatelessWidget {
  const RowFeatures({
    super.key,
    required this.featureIcon,
    required this.featureTitle,
    required this.featureScript,
  });

  final String featureIcon;
  final String featureTitle;
  final String featureScript;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: AppColors.surfaceBrandTint,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Image.asset(
            featureIcon,
            width: 22.w,
            height: 22.h,
            color: AppColors.brandPrimary,
          ),
        ),
        Column(
          spacing: 5.h,
          crossAxisAlignment: .start,
          children: [
            Text(featureTitle, style: AppTextStyles().labelStrong15),
            Text(
              featureScript,
              style: AppTextStyles(
                textColor: AppColors.textSecondary,
              ).bodySmall13,
            ),
          ],
        ),
      ],
    );
  }
}
