import 'package:ai_lingo/core/constants/app_colors.dart';
import 'package:ai_lingo/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RowFeatures extends StatelessWidget{
  const RowFeatures({super.key, required this.featureIcon, required this.featureTitle, required this.featureScript});

  final String featureIcon;
  final String featureTitle;
  final String featureScript;

  @override
  Widget build(BuildContext context) {
    return Row(
              spacing: 10,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceTintStrong,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SvgPicture.asset(
                    featureIcon,
                    width: 22,
                    height: 22,
                    color: AppColors.primary,
                  ),
                ),
                Column(
                  spacing: 5,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      featureTitle,
                      style: AppTextStyles.itemTitle,
                    ),
                    Text(
                      featureScript,
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
              ],
            );
  }

}