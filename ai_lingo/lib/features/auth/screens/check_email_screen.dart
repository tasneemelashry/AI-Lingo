import 'dart:async';
import 'package:ai_lingo/core/routing/routes.dart';
import 'package:ai_lingo/core/theme/app_colors.dart';
import 'package:ai_lingo/core/theme/app_text_styles.dart';
import 'package:ai_lingo/core/widgets/app_snack_bar.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/features/auth/cubit/auth_cubit.dart';
import 'package:ai_lingo/features/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

enum CheckEmailType { verification, passwordReset }

class CheckEmailArgs {
  const CheckEmailArgs({
    required this.email,
    required this.type,
    required this.next,
    this.linkJustSent = false,
  });

  final String email;
  final CheckEmailType type;
  final String next;
  final bool linkJustSent;
}

class CheckEmailScreen extends StatefulWidget {
  const CheckEmailScreen({super.key, required this.args});
  final CheckEmailArgs args;

  @override
  State<CheckEmailScreen> createState() => _CheckEmailScreenState();
}

class _CheckEmailScreenState extends State<CheckEmailScreen> {
  static const int cooldownSeconds = 30;

  Timer? timer;
  int secondsLeft = 0;

  bool get isVerification => widget.args.type == CheckEmailType.verification;

  @override
  void initState() {
    super.initState();
    if (widget.args.linkJustSent) startCooldown();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startCooldown() {
    this.timer?.cancel();
    secondsLeft = cooldownSeconds;
    this.timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft <= 1) timer.cancel();
      setState(() => secondsLeft = secondsLeft - 1);
    });
  }

  void resend() {
    final cubit = context.read<AuthCubit>();
    if (isVerification) {
      cubit.sendEmailVerification();
    } else {
      cubit.forgotPassword(widget.args.email);
    }
    setState(startCooldown);
  }

  Future<void> checkVerified() async {
    final cubit = context.read<AuthCubit>();
    final verified = await cubit.checkEmailVerified();
    if (!mounted) return;
    if (verified) {
      context.go(widget.args.next);
    } else if (cubit.state is Authenticated) {
      showErrorSnackBar(
        context,
        'Your email is not verified yet. Open the link we sent you, then try again.',
      );
    }
  }

  Future<void> backToSignIn() async {
    if (isVerification) {
      await context.read<AuthCubit>().signOut();
      if (!mounted) return;
    }
    context.go(Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    final canResend = secondsLeft <= 0;
    final email = widget.args.email;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showErrorSnackBar(context, state.failure.message);
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
              child: Column(
                spacing: 5.h,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: 14.h,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 40.h),
                          Container(
                            padding: EdgeInsets.all(20.r),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceBrandTint,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Icon(
                              Icons.email_outlined,
                              color: AppColors.brandPrimaryDark,
                              size: 52.r,
                            ),
                          ),
                          Text(
                            isVerification
                                ? 'Verify your email'
                                : 'Check your email',
                            style: AppTextStyles.headingHeroTitle26,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            isVerification
                                ? 'We sent a verification link to $email.\nOpen it, then come back and tap the button below.'
                                : 'We sent a reset link to $email.\nIt works for a limited time.',
                            style: AppTextStyles.bodyDefault15.copyWith(
                              color: AppColors.textSecondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            padding: EdgeInsets.all(20.r),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceBrandTint,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              spacing: 10.w,
                              children: [
                                Icon(
                                  Icons.info_outline_rounded,
                                  size: 20.r,
                                  color: AppColors.brandPrimaryDark,
                                ),
                                Flexible(
                                  child: Text(
                                    'Can’t find it? Check your spam folder.',
                                    style: AppTextStyles.bodyHint14.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isVerification)
                    CustomButton(
                      onPressed: checkVerified,
                      isLoading: isLoading,
                      buttonText: 'I’ve verified my email',
                    )
                  else
                    CustomButton(
                      onPressed: backToSignIn,
                      buttonText: 'Back to sign in',
                    ),
                  TextButton(
                    onPressed: canResend && !isLoading ? resend : null,
                    child: Text(
                      canResend
                          ? 'Resend the link'
                          : 'Resend in ${secondsLeft}s',
                      style: AppTextStyles.labelStrong15.copyWith(
                        color: canResend
                            ? AppColors.brandPrimaryDark
                            : AppColors.textSecondary,
                      ),
                    ),
                  ),
                  if (isVerification)
                    TextButton(
                      onPressed: isLoading ? null : backToSignIn,
                      child: Text(
                        'Back to sign in',
                        style: AppTextStyles.labelStrong15.copyWith(
                          color: AppColors.brandPrimaryDark,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
