import 'package:ai_lingo/core/constants/app_assets.dart';
import 'package:ai_lingo/core/routing/routes.dart';
import 'package:ai_lingo/core/theme/app_colors.dart';
import 'package:ai_lingo/core/theme/app_text_styles.dart';
import 'package:ai_lingo/core/widgets/app_snack_bar.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:ai_lingo/core/widgets/form_page_layout.dart';
import 'package:ai_lingo/core/utils/validators.dart';
import 'package:ai_lingo/features/auth/cubit/auth_cubit.dart';
import 'package:ai_lingo/features/auth/cubit/auth_state.dart';
import 'package:ai_lingo/features/auth/screens/check_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void submit() {
    if (!(formKey.currentState?.validate() ?? false)) return;
    FocusScope.of(context).unfocus();
    context.read<AuthCubit>().signIn(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          if (state.user.emailVerified) {
            context.go(Routes.home);
          } else {
            context.go(
              Routes.checkEmail,
              extra: CheckEmailArgs(
                email: state.user.email ?? '',
                type: CheckEmailType.verification,
                next: Routes.home,
              ),
            );
          }
        } else if (state is AuthError) {
          showErrorSnackBar(context, state.failure.message);
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return Scaffold(
          body: SafeArea(
            child: Form(
              key: formKey,
              child: FormPageLayout(
                header: [
                  Image.asset(
                    AppAssets.appLogo,
                    width: 64.w,
                    height: 64.h,
                    alignment: .topStart,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'WELCOME BACK',
                    style: AppTextStyles.labelStrong12.copyWith(
                      color: AppColors.brandPrimaryDark,
                    ),
                  ),
                  Text(
                    'Pick up where you left off',
                    style: AppTextStyles.headingScreenTitle26,
                  ),
                  Text(
                    'Sign in to see your words and lessons.',
                    style: AppTextStyles.bodyDefault15.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text('Email', style: AppTextStyles.formFieldLabel14),
                  CustomTextField(
                    controller: emailController,
                    validator: Validators.emailValidation,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.email],
                    enabled: !isLoading,
                  ),
                  SizedBox(height: 5.h),
                  Text('Password', style: AppTextStyles.formFieldLabel14),
                  CustomTextField(
                    controller: passwordController,
                    validator: Validators.existingPassword,
                    isPassword: true,
                    textInputAction: TextInputAction.done,
                    autofillHints: const [AutofillHints.password],
                    onFieldSubmitted: (_) => submit(),
                    enabled: !isLoading,
                  ),
                  InkWell(
                    onTap: () => context.push(Routes.forgotPassword),
                    child: Text(
                      'Forgot password?',
                      style: AppTextStyles.formFieldLabel14.copyWith(
                        color: AppColors.brandPrimaryDark,
                      ),
                      textAlign: .end,
                    ),
                  ),
                ],
                footer: [
                  CustomButton(
                    onPressed: submit,
                    isLoading: isLoading,
                    buttonText: 'Sign in',
                    buttonIcon: AppAssets.arrowRightIcon,
                  ),
                  InkWell(
                    onTap: () => context.go(Routes.signUp),
                    child: Text(
                      'New here? Create an account',
                      style: AppTextStyles.labelStrong15.copyWith(
                        color: AppColors.brandPrimaryDark,
                      ),
                      textAlign: .center,
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
