import 'package:ai_lingo/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
  });

  final String? prefixIcon;
  final String? suffixIcon;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffFFFFFF),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19.r),
          borderSide: BorderSide(color: AppColors.borderStrong),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19.r),
          borderSide: BorderSide(color: AppColors.brandPrimary),
        ),
        hint: Text(hintText ?? '', style: TextStyle(color: Color(0xff757575))),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: EdgeInsets.all(10.w),
                child: Image.asset(
                  prefixIcon!,
                  color: Color(0xff757575),
                  width: 10.w,
                  height: 10.h,
                ),
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: EdgeInsets.all(10.w),
                child: Image.asset(
                  suffixIcon!,
                  color: Color(0xff757575),
                  width: 10.w,
                  height: 10.h,
                ),
              )
            : null,
      ),
    );
  }
}
