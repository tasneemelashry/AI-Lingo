import 'dart:async';
import 'package:ai_lingo/core/routing/routes.dart';
import 'package:ai_lingo/core/theme/app_colors.dart';
import 'package:ai_lingo/core/theme/app_text_styles.dart';
import 'package:ai_lingo/features/onboarding/widgets/circle_container.dart';
import 'package:flutter/material.dart';
import 'package:ai_lingo/core/constants/app_assets.dart';
import 'package:ai_lingo/features/auth/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(milliseconds: 1500), goNext);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void goNext() {
    if (!mounted) return;
    final signedIn = context.read<AuthCubit>().currentUser != null;
    Navigator.of(context).pushNamedAndRemoveUntil(
      signedIn ? Routes.home : Routes.welcome,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brandPrimary,
      body: Stack(
        children: [
          Positioned(
            top: -80.r,
            left: -80.r,
            child: CircleContainer(size: 250.r),
          ),
          Positioned(
            bottom: -70.r,
            right: -70.r,
            child: CircleContainer(size: 250.r),
          ),
          Center(
            child: Column(
              spacing: 5.h,
              mainAxisSize: .min,
              children: [
                Container(
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: AppColors.neutralWhite,
                    borderRadius: BorderRadius.circular(48.r),
                  ),
                  child: Image.asset(
                    AppAssets.splashLogo,
                    width: 104.w,
                    height: 104.h,
                  ),
                ),
                Text(
                  'AI-Lingo',
                  style: AppTextStyles.splashAppName40.copyWith(
                    color: AppColors.neutralWhite,
                  ),
                ),
                Text(
                  'Chat your way to better English.',
                  style: AppTextStyles.splashTagline16.copyWith(
                    color: AppColors.neutralWhite,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
