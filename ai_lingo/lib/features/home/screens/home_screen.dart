import 'package:ai_lingo/core/theme/app_text_styles.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final name = context.read<AuthCubit>().currentUser?.name;
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
                name == null || name.isEmpty ? 'Hi!' : 'Hi, $name',
                style: AppTextStyles.headingScreenTitle26,
                textAlign: TextAlign.center,
              ),
              Text(
                'Home is coming soon.',
                style: AppTextStyles.bodyDefault15,
                textAlign: TextAlign.center,
              ),
              CustomButton(
                onPressed: () => context.read<AuthCubit>().signOut(),
                buttonText: 'Sign out',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
