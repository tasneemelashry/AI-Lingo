import 'package:ai_lingo/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.buttonIcon,
    required this.buttonColor,
    required this.textStyle, required this.buttonWidth,
  });

  final void Function() onPressed;
  final Color buttonColor;
  final String buttonText;
  final TextStyle textStyle;
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
        minimumSize: .fromHeight(50),
        maximumSize: .fromWidth(buttonWidth)
      ),
      child: Row(
        spacing: 10,
        mainAxisSize: .min,
        children: [
          Text(buttonText, style: textStyle),
          buttonIcon != null
              ? SvgPicture.asset(buttonIcon!, width: 25, color: AppColors.white)
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
