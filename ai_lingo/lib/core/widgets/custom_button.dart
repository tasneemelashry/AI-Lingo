import 'package:ai_lingo/core/theme/app_colors.dart';
import 'package:ai_lingo/core/theme/app_text_styles.dart';
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
    this.isLoading = false,
  });

  final VoidCallback? onPressed;
  final Color buttonColor;
  final String buttonText;
  final TextStyle? textStyle;
  final String? buttonIcon;
  final double buttonWidth;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        disabledBackgroundColor: buttonColor.withValues(alpha: 0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
        fixedSize: Size(buttonWidth, 56),
      ),
      child: isLoading
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: AppColors.neutralWhite,
              ),
            )
          : Row(
              spacing: 10,
              mainAxisSize: .min,
              children: [
                Text(
                  buttonText,
                  style:
                      textStyle ??
                      AppTextStyles.buttonLabel17.copyWith(
                        color: AppColors.neutralWhite,
                      ),
                ),
                if (buttonIcon != null)
                  Image.asset(
                    buttonIcon!,
                    width: 25,
                    color: AppColors.neutralWhite,
                  ),
              ],
            ),
    );
  }
}
