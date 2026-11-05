import 'package:ai_lingo/core/constants/app_colors.dart';
import 'package:ai_lingo/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.buttonIcon,
    this.buttonColor = AppColors.brandPrimary,
    this.textStyle,
    this.buttonWidth = double.infinity,
  });

  final void Function() onPressed;
  final Color buttonColor;
  final String buttonText;
  final TextStyle? textStyle;
  final String? buttonIcon;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
        minimumSize: .fromHeight(56),
        maximumSize: .fromHeight(56),
      ),
      child: Row(
        spacing: 10,
        mainAxisSize: .min,
        children: [
          Text(
            buttonText,
            style:
                textStyle ??
                AppTextStyles(textColor: AppColors.neutralWhite).buttonLabel17,
          ),
          buttonIcon != null
              ? Image.asset(
                  buttonIcon!,
                  width: 25,
                  color: AppColors.neutralWhite,
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
