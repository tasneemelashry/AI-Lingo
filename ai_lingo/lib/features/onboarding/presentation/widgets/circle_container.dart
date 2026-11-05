import 'package:ai_lingo/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.w,
      height: size.h,
      decoration: BoxDecoration(
        shape: .circle,
        color: AppColors.brandPrimarySoft,
      ),
    );
  }
}
