import 'package:ai_lingo/core/constants/app_assets.dart';
import 'package:ai_lingo/core/theme/app_colors.dart';
import 'package:ai_lingo/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.hintText,
    this.isPassword = false,
    this.enabled = true,
  });

  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final ValueChanged<String>? onFieldSubmitted;
  final String? prefixIcon;
  final String? hintText;
  final bool isPassword;
  final bool enabled;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscure = true;

  OutlineInputBorder border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(19.r),
    borderSide: BorderSide(color: color),
  );

  Widget icon(String asset) => Image.asset(
    asset,
    color: AppColors.textPlaceholder,
    width: 10.w,
    height: 10.h,
  );

  @override
  Widget build(BuildContext context) {
    final prefix = widget.prefixIcon;
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      autofillHints: widget.autofillHints,
      onFieldSubmitted: widget.onFieldSubmitted,
      enabled: widget.enabled,
      obscureText: widget.isPassword && obscure,
      style: AppTextStyles.inputValue16,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.neutralWhite,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: AppColors.textPlaceholder),
        enabledBorder: border(AppColors.borderStrong),
        focusedBorder: border(AppColors.brandPrimary),
        errorBorder: border(AppColors.statusDanger),
        focusedErrorBorder: border(AppColors.statusDanger),
        errorStyle: AppTextStyles.bodySmall13.copyWith(
          color: AppColors.statusDanger,
        ),
        prefixIcon: prefix == null
            ? null
            : Padding(padding: EdgeInsets.all(10.w), child: icon(prefix)),
        suffixIcon: widget.isPassword
            ? IconButton(
                tooltip: obscure ? 'Show password' : 'Hide password',
                padding: EdgeInsets.all(10.w),
                onPressed: () => setState(() => obscure = !obscure),
                icon: icon(obscure ? AppAssets.eyeIcon : AppAssets.eyeOffIcon),
              )
            : null,
      ),
    );
  }
}
